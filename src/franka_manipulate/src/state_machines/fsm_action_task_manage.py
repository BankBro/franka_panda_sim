#!/usr/bin/env python

from common import *
from event_master import EventManager

from franka_predict_action.srv import (
    FetchSingleAction,
    FetchSingleActionResponse,
)
from franka_manipulate.srv import(
    MoveitPosCtl,
    MoveitPosCtlRequest,
    MoveitPosCtlResponse
)
from franka_predict_action.srv import (
    StoreNewActionToQueue,
    StoreNewActionToQueueRequest,
    StoreNewActionToQueueResponse,
)


class ActionTaskManageFSM(ThreadedStateMachine):
    def __init__(self, event_manager: EventManager):
        self.fsm_states = [
            {'name': 'init',           'on_enter': 'init_callback'},
            {'name': 'fetch_action',   'on_enter': 'fetch_action_callback'},
            {'name': 'check_continue', 'on_enter': 'check_continue_callback'},
            {'name': 'exec_action',    'on_enter': 'exec_action_callback'},
        ]
        self.fsm_transitions = [
            {'trigger': 'usr_req',                'source': 'init',              'dest': 'fetch_action'},
            {'trigger': 'fetch_action_failed',    'source': 'fetch_action',      'dest': 'init'},
            {'trigger': 'retry_fetch_action',     'source': 'fetch_action',      'dest': 'fetch_action'},
            {'trigger': 'fetch_ok_queue_remain',  'source': 'fetch_action',      'dest': 'exec_action'},
            {'trigger': 'fetch_ok_queue_empty',   'source': 'fetch_action',      'dest': 'exec_action'},
            {'trigger': 'reach_threshold',        'source': 'exec_action',       'dest': 'fetch_action'},
            {'trigger': 'exec_action_failed',     'source': 'exec_action',       'dest': 'check_continue'},
            {'trigger': 'keep_exec',              'source': 'check_continue',    'dest': 'fetch_action'},
            {'trigger': 'stop_exec',              'source': 'check_continue',    'dest': 'init'},
        ]
        self.fsm_initial_state = "init"
        super().__init__(self.fsm_states, self.fsm_transitions, self.fsm_initial_state)

        self.name = "action_task_manage"
        self.event_manager = event_manager
        self.tf_manager = TFManager()
        self.on_enter_lock = threading.Lock()

        # Init service.
        self.exec_action = rospy.ServiceProxy("moveit_pos_ctl_service", MoveitPosCtl)
        self.fetch_action_service = rospy.ServiceProxy("fetch_single_action_from_queue_service", FetchSingleAction)
        self.predict_store_action = rospy.ServiceProxy("store_new_action_to_queue_service", StoreNewActionToQueue)
        return

    def init_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")
        return

    def fetch_action_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        # fetch action
        rospy.loginfo(f"Start to fetch action.")
        rospy.wait_for_service("fetch_single_action_from_queue_service")

        response: FetchSingleActionResponse = self.fetch_action_service()
        fetch_ret = response.fetch_ret
        action = response.action  # a list of pos and euler
        queue_size = response.queue_size
        rospy.loginfo(f"FSM({self.name}) fetch action, result({fetch_ret}).")

        # If queue is empty, predict and store new action.
        if not fetch_ret:
            rospy.logwarn(f"FSM({self.name}) queue is empty.")

            with REQ_INFO_MUTEX:
                global REQ_MODEL_NAME
                request = StoreNewActionToQueueRequest()
                request.model_name = REQ_MODEL_NAME
                request.instruction = REQ_INSTRUCTION
                request.unnorm_key = REQ_UNNORM_KEY
                rospy.loginfo(f"model_name={REQ_MODEL_NAME}), instruction={REQ_INSTRUCTION}, unnorm_key={REQ_UNNORM_KEY}.")

            rospy.wait_for_service("store_new_action_to_queue_service")
            response: StoreNewActionToQueueResponse = self.predict_store_action(request)

            if response.store_ret:
                rospy.loginfo("Predict and store action succeed.")
                self.event_manager.put_event_in_queue('retry_fetch_action')
                return
            else:
                rospy.logerr("Predict and store action failed.")
                self.event_manager.put_event_in_queue('fetch_action_failed')

                global USR_REQ_DONE
                USR_REQ_DONE.set()
                return

        # fetch an action succeed
        global SOURCE_POS
        with SOURCE_POS_MUTEX:
            current_pos = self.tf_manager.get_link_pos(REFERENCE_FRAME, END_EFFECTOR_FRAME)
            SOURCE_POS = [current_pos[0], current_pos[1], current_pos[2]]
        rospy.loginfo(f"Fetch current pos({current_pos[0], current_pos[1], current_pos[2]}).")

        global TARGET_POS
        with TARGET_POS_MUTEX:
            TARGET_POS = [action[0], action[1], action[2]]
        rospy.loginfo(f"Fetch target pos({action[0], action[1], action[2]}).")

        if fetch_ret and queue_size > 0:
            self.event_manager.put_event_in_queue('fetch_ok_queue_remain')
        elif fetch_ret and queue_size == 0:
            rospy.loginfo("Fetch action queue succeed, but queue is empty now.")
            self.event_manager.put_event_in_queue('fetch_ok_queue_empty')
        return

    def check_continue_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        if USR_REQ_DONE.is_set():
            # User's request has been done, fsm stop working.
            self.event_manager.put_event_in_queue('stop_exec')
        else:
            self.event_manager.put_event_in_queue('keep_exec')
        return

    def exec_action_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        with TARGET_POS_MUTEX:
            action = TARGET_POS

        request = MoveitPosCtlRequest()
        request.x = action[0]
        request.y = action[1]
        request.z = action[2]
        request.yaw = action[3]
        request.pitch = action[4]
        request.roll = action[5]

        rospy.wait_for_service("moveit_pos_ctl_service")
        response: MoveitPosCtlResponse = self.exec_action(request)
        if not response.go_ret:
            rospy.logerr("Execute action failed.")
            self.event_manager.put_event_in_queue("exec_action_failed")
            return
        
        # wait for action reaching threshold
        rospy.loginfo("Waiting for action reaching threshold...")
        global ACTION_REACH_THRESHOLD
        ACTION_REACH_THRESHOLD.wait()
        ACTION_REACH_THRESHOLD.clear()

        self.event_manager.put_event_in_queue("reach_threshold")
        return
#!/usr/bin/env python

import rospy
import threading
import traceback

from common import ThreadedStateMachine, TFManager
from event_master import EventManager
from global_vars import global_vars

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
from franka_predict_action.srv import (
    ClearActionQueue,
    ClearActionQueueRequest,
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
            {'trigger': 'usr_req',                'source': 'init',            'dest': 'fetch_action',    'before': 'before_usr_req'},
            {'trigger': 'predict_action_failed',  'source': 'fetch_action',    'dest': 'init'},
            {'trigger': 'retry_fetch_action',     'source': 'fetch_action',    'dest': 'fetch_action'},
            {'trigger': 'fetch_ok_queue_remain',  'source': 'fetch_action',    'dest': 'exec_action'},
            {'trigger': 'fetch_ok_queue_empty',   'source': 'fetch_action',    'dest': 'exec_action'},
            {'trigger': 'reach_threshold',        'source': 'exec_action',     'dest': 'fetch_action'},
            {'trigger': 'exec_action_failed',     'source': 'exec_action',     'dest': 'check_continue'},
            {'trigger': 'keep_exec',              'source': 'check_continue',  'dest': 'fetch_action'},
            {'trigger': 'stop_exec',              'source': 'check_continue',  'dest': 'init'},
        ]
        self.fsm_initial_state = "init"
        super().__init__(self.fsm_states, self.fsm_transitions, self.fsm_initial_state)

        self.name = "action_task_manage"
        self.reference_frame = global_vars.get("REFERENCE_FRAME")
        self.end_effector_frame = global_vars.get("END_EFFECTOR_FRAME")
        self.usr_req_done = global_vars.get("USR_REQ_DONE")
        self.event_manager = event_manager
        self.tf_manager = TFManager()
        self.on_enter_lock = threading.Lock()

        self.action_reach_threshold = global_vars.get("ACTION_REACH_THRESHOLD")

        self.model_name = None
        self.instruction = None
        self.unnorm_key = None

        # Init service.
        self.exec_action = rospy.ServiceProxy("moveit_pos_ctl_service", MoveitPosCtl)
        self.fetch_action_service = rospy.ServiceProxy("fetch_single_action_from_queue_service", FetchSingleAction)
        self.predict_store_action = rospy.ServiceProxy("store_new_action_to_queue_service", StoreNewActionToQueue)
        self.clear_action_queue = rospy.ServiceProxy("clear_action_queue_service", ClearActionQueue)
        return

    def before_usr_req(self):
        self.model_name = global_vars.get("REQ_MODEL_NAME")
        self.instruction = global_vars.get("REQ_INSTRUCTION")
        self.unnorm_key = global_vars.get("REQ_UNNORM_KEY")

        rospy.loginfo(f"FSM({self.name}) fetch action, model({self.model_name}), "
                      f"instruction({self.instruction}), unnorm_key({self.unnorm_key}).")
        return

    def init_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")
        self.model_name = None
        self.instruction = None
        self.unnorm_key = None
        return
    
    def _predict_store_action_failed(self):
        rospy.logerr("Predict and store action failed.")
        self.event_manager.put_event_in_queue('predict_action_failed')
        self.usr_req_done.set()
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

        # Fetch an action failed, because of empty queue, ready to predict and store new action.
        if not fetch_ret:
            rospy.logwarn(f"FSM({self.name}) queue is empty.")

            request = StoreNewActionToQueueRequest()
            request.model_name = self.model_name
            request.instruction = self.instruction
            request.unnorm_key = self.unnorm_key

            rospy.wait_for_service("store_new_action_to_queue_service")
            try:
                response: StoreNewActionToQueueResponse = self.predict_store_action(request)
                if response.store_ret:
                    rospy.loginfo("Predict and store action succeed.")
                    self.event_manager.put_event_in_queue('retry_fetch_action')
                else:
                    self._predict_store_action_failed()

            except Exception as e:
                self._predict_store_action_failed()
                rospy.logerr("Traceback:\n" + ''.join(traceback.format_tb(e.__traceback__)))
            return

        # Fetch an action succeed, ready to execute the action.
        current_pos, _ = self.tf_manager.get_link_pos(self.reference_frame, self.end_effector_frame)
        # TODO: the source pos is not the real pos when predict action.
        source_pos = [current_pos.x, current_pos.y, current_pos.z]
        global_vars.set("SOURCE_POS", source_pos)
        rospy.loginfo(f"Fetch current pos({source_pos}).")

        target_pos = [action[0], action[1], action[2]]
        global_vars.set("TARGET_POS", target_pos)
        rospy.loginfo(f"Fetch target pos({target_pos}).")

        target_action = action
        global_vars.set("TARGET_ACTION", target_action)
        rospy.loginfo(f"Fetch target action({target_action}).")  # TODO: TARGET_POS TARGET_ACTION is delta action.

        if fetch_ret and queue_size > 0:
            self.event_manager.put_event_in_queue('fetch_ok_queue_remain')
        elif fetch_ret and queue_size == 0:
            rospy.loginfo("Fetch action queue succeed, but queue is empty now.")
            self.event_manager.put_event_in_queue('fetch_ok_queue_empty')
        return

    def check_continue_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        if self.usr_req_done.is_set():
            # User's request has been done, fsm stop working.
            rospy.loginfo("FSM({self.name}) check, stop exec.")
            self.event_manager.put_event_in_queue('stop_exec')

            # clear the action queue.
            request = ClearActionQueueRequest()
            self.clear_action_queue(request)
            rospy.wait_for_service("clear_action_queue_service")

        else:
            self.event_manager.put_event_in_queue('keep_exec')
        return

    def exec_action_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        action = global_vars.get("TARGET_ACTION")
        request = MoveitPosCtlRequest()
        request.x = action[0]
        request.y = action[1]
        request.z = action[2]
        request.roll = action[3]
        request.pitch = action[4]
        request.yaw = action[5]  # TODO: the order is correct?

        rospy.wait_for_service("moveit_pos_ctl_service")
        response: MoveitPosCtlResponse = self.exec_action(request)  # Async call.

        if not response.go_ret:
            rospy.logerr("Execute action failed.")
            self.action_reach_threshold.set()
            self.event_manager.put_event_in_queue("exec_action_failed")
            return
        
        # wait for action reaching threshold
        rospy.loginfo("Waiting for action reaching threshold...")
        self.action_reach_threshold.wait()
        self.action_reach_threshold.clear()

        self.event_manager.put_event_in_queue("reach_threshold")
        return
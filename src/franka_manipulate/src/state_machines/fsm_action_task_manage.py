#!/usr/bin/env python

from event_master import EventManager
from common import *
import time

from franka_predict_action.srv import (
    FetchSingleAction,
    FetchSingleActionResponse,
)

from franka_manipulate.srv import(
    MoveitPosCtl,
    MoveitPosCtlRequest,
    MoveitPosCtlResponse
)


class ActionTaskManageFSM(ThreadedStateMachine):
    def __init__(self, event_manager: EventManager):
        self.fsm_states = [
            {'name': 'init',           'on_enter': 'init_callback'},
            {'name': 'fetch_action',   'on_enter': 'fetch_action_callback'},
            {'name': 'check_continue', 'on_enter': 'check_continue_callback'},
            {'name': 'exec_action',    'on_enter': 'exec_action_callback'},
            {'name': 'predict_action', 'on_enter': 'predict_action_callback'},
            {'name': 'clear_action',   'on_enter': 'clear_action_callback'},
        ]
        self.fsm_transitions = [
            {'trigger': 'usr_req',                'source': 'init',              'dest': 'fetch_action'},
            {'trigger': 'fetch_ok_queue_remain',  'source': 'fetch_action',      'dest': 'exec_action'},
            {'trigger': 'fetch_ok_queue_empty',   'source': 'fetch_action',      'dest': 'exec_action'},
            {'trigger': 'reach_threshold',        'source': 'exec_action',       'dest': 'fetch_action'},
            {'trigger': 'exec_action_failed',     'source': 'exec_action',       'dest': 'clear_action'},
            {'trigger': 'clear_queue_done',       'source': 'clear_action',      'dest': 'check_continue'},
            {'trigger': 'queue_empty',            'source': 'fetch_action',      'dest': 'check_continue'},
            {'trigger': 'predicting_action',      'source': 'fetch_action',      'dest': 'predict_action'},
            {'trigger': 'predict_action_succeed', 'source': 'predict_action',    'dest': 'fetch_action'},
            {'trigger': 'predict_action_failed',  'source': 'predict_action',    'dest': 'check_continue'},
            {'trigger': 'keep_exec',              'source': 'check_continue',    'dest': 'fetch_action'},
            {'trigger': 'stop_exec',              'source': 'check_continue',    'dest': 'init'},
        ]
        self.fsm_initial_state = "init"
        super().__init__(self.fsm_states, self.fsm_transitions, self.fsm_initial_state)

        self.name = "action_task_manage"
        self.event_manager = event_manager
        self.tf_manager = TFManager()

        # define each callback function while entering each state
        # self.machine.on_enter_init(self.init_callback)
        # self.machine.on_enter_fetch_action(self.fetch_action_callback)
        # self.machine.on_enter_check_continue(self.check_continue_callback)
        # self.machine.on_enter_exec_action(self.exec_action_callback)
        # self.machine.on_enter_predict_action(self.predict_action_callback)
        # self.machine.on_enter_clear_action(self.clear_action_callback)

        # Init fetch action from queue service.
        self.fetch_action_service = rospy.ServiceProxy("fetch_single_action_from_queue_service", FetchSingleAction)
        # Init store action to queue service.
        self.exec_action = rospy.ServiceProxy("moveit_pos_ctl_service", MoveitPosCtl)
        return

    def init_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")
        # self.event_manager.put_event_in_queue('usr_req')
        return

    def fetch_action_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        # Check if fsm is predicting action.
        with DURING_PREDICT_ACTION_MUTEX:
            if DURING_PREDICT_ACTION:
                rospy.loginfo(f"###################################################### put_event_in_queue predicting_action")
                self.event_manager.put_event_in_queue('predicting_action')
                return

        # fetch action
        rospy.loginfo(f"Start to fetch action.")
        rospy.wait_for_service("fetch_single_action_from_queue_service")
        response: FetchSingleActionResponse = self.fetch_action_service()
        fetch_ret = response.fetch_ret
        action = response.action  # a list of pos and euler
        queue_size = response.queue_size
        rospy.loginfo(f"FSM({self.name}) fetch action from fetch_single_action_from_queue_service, result: {fetch_ret}.")

        # Check if queue is empty.
        if not fetch_ret:
            rospy.logwarn(f"FSM({self.name}) queue is empty.")
            self.event_manager.put_event_in_queue('queue_empty')
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
        # time.sleep(10)

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
            self.event_manager.put_event_in_queue("exec_action_failed")
            return
        
        global ACTION_REACH_THRESHOLD
        # wait for action reaching threshold
        ACTION_REACH_THRESHOLD.wait()
        # Clear tag as False after action reaching threshold.
        ACTION_REACH_THRESHOLD.clear()
        self.event_manager.put_event_in_queue("reach_threshold")
        return

    def predict_action_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        global PREDICT_ACTION_DONE
        # wait for predict action done
        PREDICT_ACTION_DONE.wait()
        PREDICT_ACTION_DONE.clear()
        return

    def clear_action_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        global CLEAR_ACTION_QUEUE_DONE
        # wait for clear action queue done
        CLEAR_ACTION_QUEUE_DONE.wait()
        CLEAR_ACTION_QUEUE_DONE.clear()
        return
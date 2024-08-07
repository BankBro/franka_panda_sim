#!/usr/bin/env python

from common import *
from event_master import EventManager

from franka_predict_action.srv import (
    StoreNewActionToQueue,
    StoreNewActionToQueueRequest,
    StoreNewActionToQueueResponse,
)
from franka_predict_action.srv import (
    ClearActionQueue,
    ClearActionQueueResponse,
)


class ActionQueueFSM(ThreadedStateMachine):
    def __init__(self, event_manager: EventManager):
        self.fsm_states = ['init', 'predict_store_action', 'clear_queue']
        self.fsm_transitions = [
            {'trigger': 'fetch_ok_queue_remain',  'source': 'init',                 'dest': 'predict_store_action'},
            {'trigger': 'queue_empty',            'source': 'init',                 'dest': 'predict_store_action'},
            {'trigger': 'predict_action_succeed', 'source': 'predict_store_action', 'dest': 'init'},
            {'trigger': 'predict_action_failed',  'source': 'predict_store_action', 'dest': 'init'},
            {'trigger': 'exec_action_failed',     'source': 'init',                 'dest': 'clear_queue'},
            {'trigger': 'stop_exec',              'source': 'init',                 'dest': 'clear_queue'},
            {'trigger': 'clear_queue_done',       'source': 'clear_queue',          'dest': 'init'},
        ]
        self.fsm_initial_state = "init"
        super().__init__(self.fsm_states, self.fsm_transitions, self.fsm_initial_state)

        self.name = "action_queue"
        self.event_manager = event_manager
        self.tf_manager = TFManager()

        PREDICT_ACTION_DONE.clear()
        CLEAR_ACTION_QUEUE_DONE.clear()

        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_predict_store_action(self.predict_store_action_callback)
        self.machine.on_enter_clear_queue(self.clear_queue_callback)

        # subscribe services
        self.predict_store_action = rospy.ServiceProxy("store_new_action_to_queue_service", StoreNewActionToQueue)
        self.clear_action_queue = rospy.ServiceProxy("clear_action_queue_service", ClearActionQueue)
        return

    def init_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")
        return

    def predict_store_action_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        global DURING_PREDICT_ACTION
        with DURING_PREDICT_ACTION_MUTEX:
            DURING_PREDICT_ACTION = True
            rospy.loginfo(f"set DURING_PREDICT_ACTION as True.")
        
        # TODO: start to predict and store action
        request = StoreNewActionToQueueRequest()
        with REQ_INFO_MUTEX:
            request.model_name = REQ_MODEL_NAME
            request.instruction = REQ_INSTRUCTION
            request.unnorm_key = REQ_UNNORM_KEY

        rospy.wait_for_service("store_new_action_to_queue_service")
        response: StoreNewActionToQueueResponse = self.predict_store_action(request)

        if response.store_ret:
            rospy.loginfo("Predict action succeed!")
            self.event_manager.put_event_in_queue('predict_action_succeed')
        else:
            rospy.logerr("Predict action failed!")
            self.event_manager.put_event_in_queue('predict_action_failed')
        
        # finish predict and store action to queue
        with DURING_PREDICT_ACTION_MUTEX:
            DURING_PREDICT_ACTION = False

        global PREDICT_ACTION_DONE
        PREDICT_ACTION_DONE.set()
        return
        

    def clear_queue_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")

        rospy.wait_for_service("clear_action_queue_service")
        response: ClearActionQueueResponse = self.clear_action_queue()

        if response.clear_ret:
            self.event_manager.put_event_in_queue('clear_queue_done')

            # clear queue done
            global CLEAR_ACTION_QUEUE_DONE
            CLEAR_ACTION_QUEUE_DONE.set()
        return
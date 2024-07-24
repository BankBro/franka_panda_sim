#!/usr/bin/env python

from common import *
from event_master_2 import EventManager

from franka_predict_action.srv import (
    StoreNewActionToQueue,
    StoreNewActionToQueueRequest,
    StoreNewActionToQueueResponse,
)


states = ['init', 'predict_store_action', 'clear_queue']

transitions = [
    {'trigger': 'fetch_ok_queue_remain',  'source': 'init',                 'dest': 'predict_store_action'},
    {'trigger': 'queue_empty',            'source': 'init',                 'dest': 'predict_store_action'},
    {'trigger': 'predict_action_succeed', 'source': 'predict_store_action', 'dest': 'init'},
    {'trigger': 'predict_action_failed',  'source': 'predict_store_action', 'dest': 'init'},
    {'trigger': 'exec_action_failed',     'source': 'init',                 'dest': 'clear_queue'},
    {'trigger': 'stop_exec',              'source': 'init',                 'dest': 'clear_queue'},
    {'trigger': 'clear_queue_done',       'source': 'clear_queue',          'dest': 'init'},
]

class ActionQueueFSM():
    def __init__(self, event_manager: EventManager):
        self.name = "action_queue"
        self.event_manager = event_manager
        self.tf_manager = TFManager()

        PREDICT_ACTION_DONE.clear()
        CLEAR_ACTION_QUEUE_DONE.clear()

        # iniit fsm
        self.machine = Machine(model=self, states=states, transitions=transitions, initial='init')
        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_predict_store_action(self.predict_store_action_callback)
        self.machine.on_enter_clear_queue(self.clear_queue_callback)

        self.predict_store_action = rospy.ServiceProxy("store_new_action_to_queue_service", StoreNewActionToQueue)
        # TODO: add a service to clear queue
        # self.clear_action_queue = rospy.ServiceProxy("clear_action_queue_service", ClearActionQueue)

    def init_callback(self):
        pass

    def predict_store_action_callback(self):
        global DURING_PREDICT_ACTION

        with DURING_PREDICT_ACTION_MUTEX:
            DURING_PREDICT_ACTION = True
        
        # TODO: start to predict and store action
        request = StoreNewActionToQueueRequest()
        request.model_name = "openvla"
        request.instruction = instruction
        request.unnorm_key = unnorm_key

        response: StoreNewActionToQueueResponse = self.predict_store_action(request)

        if response.store_ret:
            self.event_manager.put_event_in_queue('predict_action_succeed')
        else:
            self.event_manager.put_event_in_queue('predict_action_failed')
        
        # finish predict and store action to queue
        with DURING_PREDICT_ACTION_MUTEX:
            DURING_PREDICT_ACTION = False

        global PREDICT_ACTION_DONE
        PREDICT_ACTION_DONE.set()
        return
        

    def clear_queue_callback(self):

        # TODO: clear queue

        # clear queue done
        global CLEAR_ACTION_QUEUE_DONE
        CLEAR_ACTION_QUEUE_DONE.set()
        return
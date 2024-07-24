#!/usr/bin/env python

from common import *
from event_master_2 import EventManager


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

        PREDICT_ACTION_DONE.clear()
        CLEAR_ACTION_QUEUE_DONE.clear()

        self.machine = Machine(model=self, states=states, transitions=transitions, initial='init')
        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_predict_store_action(self.predict_store_action_callback)
        self.machine.on_enter_clear_queue(self.clear_queue_callback)

    def init_callback(self):
        pass

    def predict_store_action_callback(self):
        with DURING_PREDICT_ACTION_MUTEX:
            DURING_PREDICT_ACTION = True
        
        # TODO: start to predict and store action
        
        # finish predict and store action to queue
        with DURING_PREDICT_ACTION_MUTEX:
                DURING_PREDICT_ACTION = False
        self.event_manager.put_event_in_queue('...')
        return
        

    def clear_queue_callback(self):

        # TODO: clear queue

        # clear queue done
        CLEAR_ACTION_QUEUE_DONE.set()
        return

# def main():
#     rospy.init_node('fsm_action_queue')
#     acion_queue_fsm_instance = ActionQueueFSM()

#     # Subscribe the topic of posting event to all FSM.
#     rospy.Subscriber("event_publish", EventPublish, partial(event_receive_callback, acion_queue_fsm_instance))
#     rospy.spin()


# if __name__ == '__main__':
#     main()
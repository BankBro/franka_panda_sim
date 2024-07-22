#!/usr/bin/env python

import rospy
from transitions import Machine
from functools import partial
from common import EventPost, event_receive_callback

from franka_manipulate.msg import EventPublish


states = ['init', 'fetch_action', 'check_continue', 'exec_action', 'predict_action', 'clear_action']

transitions = [
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


class ActionTaskManageFSM():
    def __init__(self):
        self.name = "action_task_manage"
        self.machine = Machine(model=self, states=states, transitions=transitions, initial='init')

        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_fetch_action(self.fetch_action_callback)
        self.machine.on_enter_check_continue(self.check_continue_callback)
        self.machine.on_enter_execute_action(self.exec_action_callback)
        self.machine.on_enter_predict_action(self.predict_action_callback)
        self.machine.on_enter_clear_action(self.clear_action_callback)

        # Init event post mechanism.
        self.event_post_instance = EventPost()
        self.event_post = self.event_post_instance.postEventToAllFSM

    def init_callback(self):
        self.event_post('usr_req')
        return

    def fetch_action_callback(self):
        pass

    def check_continue_callback(self):
        pass

    def exec_action_callback(self):
        pass

    def predict_action_callback(self):
        pass

    def clear_action_callback(self):
        pass

def main():
    rospy.init_node('fsm_action_task_manage')
    acion_task_manage_fsm_instance = ActionTaskManageFSM()

    # Subscribe the topic of posting event to all FSM.
    rospy.Subscriber("event_publish", EventPublish, partial(event_receive_callback, acion_task_manage_fsm_instance))
    rospy.spin()


if __name__ == '__main__':
    main()
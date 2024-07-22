#!/usr/bin/env python

from transitions import Machine
from common import EventPost, if_event_valid


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
    def __init__(self):
        self.machine = Machine(model=self, states=states, transitions=transitions, initial='init')

        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_predict_store_action(self.predict_store_action_callback)
        self.machine.on_enter_clear_queue(self.clear_queue_callback)

    def init_callback(self):
        pass

    def predict_store_action_callback(self):
        pass

    def clear_queue_callback(self):
        pass
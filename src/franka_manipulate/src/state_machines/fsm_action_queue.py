#!/usr/bin/env python

from transitions import Machine


states = ['init', 'predict_store_action', 'clear_queue']

transitions = [
    {'trigger': 'fetch_ok_queue_empty',   'source': 'fetch_action',      'dest': 'exec_action'},
]

class ActionQueueFSM(object):
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
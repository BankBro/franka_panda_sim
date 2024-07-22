#!/usr/bin/env python

from transitions import Machine


states = ['init', 'moving']

transitions = [
    {'trigger': 'fetch_ok_queue_remain',  'source': 'fetch_action',      'dest': 'exec_action'},
    {'trigger': 'fetch_ok_queue_empty',   'source': 'fetch_action',      'dest': 'exec_action'},
    {'trigger': 'reach_threshold',        'source': 'exec_action',       'dest': 'fetch_action'},
    {'trigger': 'exec_action_failed',     'source': 'exec_action',       'dest': 'clear_action'},
]

class ActionMoveFSM(object):
    def __init__(self):
        self.machine = Machine(model=self, states=states, transitions=transitions, initial='init')

        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_moving(self.moving_callback)

    def init_callback(self):
        pass

    def moving_callback(self):
        pass
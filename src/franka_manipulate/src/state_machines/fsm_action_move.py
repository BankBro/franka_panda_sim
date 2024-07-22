#!/usr/bin/env python

from transitions import Machine
from common import EventPost, if_event_valid


states = ['init', 'moving']

transitions = [
    {'trigger': 'fetch_ok_queue_remain', 'source': 'init',   'dest': 'moving'},
    {'trigger': 'fetch_ok_queue_empty',  'source': 'init',   'dest': 'moving'},
    {'trigger': 'reach_threshold',       'source': 'moving', 'dest': 'init'},
    {'trigger': 'exec_action_failed',    'source': 'moving', 'dest': 'init'},
]

class ActionMoveFSM():
    def __init__(self):
        self.machine = Machine(model=self, states=states, transitions=transitions, initial='init')

        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_moving(self.moving_callback)

    def init_callback(self):
        pass

    def moving_callback(self):
        pass
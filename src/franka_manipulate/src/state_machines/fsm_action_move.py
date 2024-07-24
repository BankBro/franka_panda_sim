#!/usr/bin/env python

import math
from common import *
from event_master_2 import EventManager


states = ['init', 'moving']

transitions = [
    {'trigger': 'fetch_ok_queue_remain', 'source': 'init',   'dest': 'moving'},
    {'trigger': 'fetch_ok_queue_empty',  'source': 'init',   'dest': 'moving'},
    {'trigger': 'reach_threshold',       'source': 'moving', 'dest': 'init'},
    {'trigger': 'exec_action_failed',    'source': 'moving', 'dest': 'init'},
]

class ActionMoveFSM():
    def __init__(self):
        self.name = "action_move"
        self.reference_frame = "world"
        self.end_effector_link = "panda_grip_center"

        self.source_pos = None
        # self.source_pos_mutex = threading.Lock()

        self.target_pos = None
        # self.target_pos_mutex = threading.Lock()

        self.action_distance_diff = None
        self.action_distance_diff_mutex = threading.Lock()

        ACTION_REACH_THRESHOLD.clear()

        self.machine = Machine(model=self, states=states, transitions=transitions, initial='init')
        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_moving(self.moving_callback)

    def init_callback(self):
        return

    def _if_reach_threshold(self, tf_buffer):
        current_pos, _ = get_link_pos(tf_buffer)

        dx = TARGET_POS[0] - current_pos.x
        dy = TARGET_POS[1] - current_pos.y
        dz = TARGET_POS[2] - current_pos.z
        diff = math.sqrt(dx**2 + dy**2 + dz**2)

        if diff / self.action_distance_diff < ACTION_THRESHOLD:
            return True

        return False

    def moving_callback(self):
        # check if the action is reaching the threshold
        tf_buffer = Buffer()
        TransformListener(tf_buffer)

        self.source_pos, _ = get_link_pos(tf_buffer)
        with TARGET_POS_MUTEX:
            self.target_pos = TARGET_POS

        rate = rospy.Rate(10)
        while not self._if_reach_threshold(tf_buffer):
            rate.sleep()

        # Set tag as True.
        global ACTION_REACH_THRESHOLD
        ACTION_REACH_THRESHOLD.set()
        return
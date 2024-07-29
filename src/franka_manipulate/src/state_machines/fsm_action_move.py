#!/usr/bin/env python

import math
from common import *
from event_master import EventManager


class ActionMoveFSM(ThreadedStateMachine):
    def __init__(self, event_manager: EventManager):
        self.states = ['init', 'moving']
        self.transitions = [
            {'trigger': 'fetch_ok_queue_remain', 'source': 'init',   'dest': 'moving'},
            {'trigger': 'fetch_ok_queue_empty',  'source': 'init',   'dest': 'moving'},
            {'trigger': 'reach_threshold',       'source': 'moving', 'dest': 'init'},
            {'trigger': 'exec_action_failed',    'source': 'moving', 'dest': 'init'},
        ]
        self.initial_state = "init"
        super().__init__(self.states, self.transitions, self.initial_state)

        self.name = "action_move"
        self.reference_frame = "world"
        self.end_effector_link = "panda_grip_center"
        self.action_distance = None
        self.event_manager = event_manager
        self.tf_manager = TFManager()

        ACTION_REACH_THRESHOLD.clear()

        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_moving(self.moving_callback)
        return

    def init_callback(self):
        return
    
    @staticmethod
    def _get_distance(pos1: list, pos2: list) -> float:
        dx = pos1[0] - pos2[0]
        dy = pos1[1] - pos2[1]
        dz = pos1[2] - pos2[2]
        return math.sqrt(dx**2 + dy**2 + dz**2)

    def _if_reach_threshold(self):
        current_pos, _ = self.tf_manager.get_link_pos(REFERENCE_FRAME, END_EFFECTOR_FRAME)
        current_pos = [current_pos[0], current_pos[1], current_pos[2]]

        with TARGET_POS_MUTEX:
            diff = ActionMoveFSM._get_distance(current_pos, TARGET_POS)

        if diff / self.action_distance < ACTION_THRESHOLD:
            return True

        return False

    def moving_callback(self):
        global ACTION_REACH_THRESHOLD

        with SOURCE_POS_MUTEX:
            with TARGET_POS_MUTEX:
                self.action_distance = ActionMoveFSM._get_distance(SOURCE_POS, TARGET_POS)

        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            # check if the action is reaching the threshold
            if self._if_reach_threshold():
                # Set tag as True.
                ACTION_REACH_THRESHOLD.set()
                self.event_manager.put_event_in_queue("reach_threshold")
                break            
            rate.sleep()
        return
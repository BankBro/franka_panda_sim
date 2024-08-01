#!/usr/bin/env python

import rospy
import math

from common import ThreadedStateMachine, TFManager
from event_master import EventManager
from global_vars import global_vars


class ActionMoveFSM(ThreadedStateMachine):
    def __init__(self, event_manager: EventManager):
        self.fsm_states = [
            {'name': 'init',   'on_enter': 'init_callback'},
            {'name': 'moving', 'on_enter': 'moving_callback'},
        ]
        self.fsm_transitions = [
            {'trigger': 'fetch_ok_queue_remain', 'source': 'init',   'dest': 'moving'},
            {'trigger': 'fetch_ok_queue_empty',  'source': 'init',   'dest': 'moving'},
            {'trigger': 'reach_threshold',       'source': 'moving', 'dest': 'init'},
            {'trigger': 'exec_action_failed',    'source': 'moving', 'dest': 'init'},
        ]
        self.fsm_initial_state = "init"
        super().__init__(self.fsm_states, self.fsm_transitions, self.fsm_initial_state)

        self.name = "action_move"
        self.reference_frame = global_vars.get("REFERENCE_FRAME")
        self.end_effector_frame = global_vars.get("END_EFFECTOR_FRAME")
        self.action_threshold = global_vars.get("ACTION_THRESHOLD")
        self.action_distance = None  # an action distance from one source to one target
        self.event_manager = event_manager
        self.tf_manager = TFManager()

        self.action_reach_threshold = global_vars.get("ACTION_REACH_THRESHOLD")
        self.action_reach_threshold.clear()
        return

    def init_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")
        return
    
    @staticmethod
    def _get_distance(pos1: list, pos2: list) -> float:
        dx = pos1[0] - pos2[0]
        dy = pos1[1] - pos2[1]
        dz = pos1[2] - pos2[2]
        return math.sqrt(dx**2 + dy**2 + dz**2)

    def _if_reach_threshold(self, target_pos):
        if self.action_reach_threshold.is_set():
            rospy.logwarn(f"FSM({self.name}) reach threshold.")
            return True
        
        current_pos, _ = self.tf_manager.get_link_pos(self.reference_frame, self.end_effector_frame)
        current_pos = [current_pos.x, current_pos.y, current_pos.z]
        diff = ActionMoveFSM._get_distance(current_pos, target_pos)
        
        ret = diff / self.action_distance < self.action_threshold
        # rospy.loginfo(f"now: {diff}/{self.action_distance},  percent: {diff / self.action_distance}")

        if diff < 0.001:
            rospy.loginfo(f"action reach to threashold.")
            return True

        return False

    def moving_callback(self):
        rospy.loginfo(f"FSM({self.name}) enter stage({self.state}).")
        self.action_reach_threshold.clear()  # Set tag as False.

        source_pos = global_vars.get("SOURCE_POS")
        target_pos = global_vars.get("TARGET_POS")
        self.action_distance = ActionMoveFSM._get_distance(source_pos, target_pos)

        rate = rospy.Rate(20)
        while not rospy.is_shutdown():
            # check if the action is reaching the threshold
            if self._if_reach_threshold(target_pos):
                self.action_reach_threshold.set() # Set tag as True.
                break
            rate.sleep()
        return
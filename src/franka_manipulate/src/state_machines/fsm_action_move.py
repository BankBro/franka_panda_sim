#!/usr/bin/env python

import rospy
from transitions import Machine
from functools import partial
from common import EventPost, event_receive_callback

from franka_manipulate.msg import EventPublish


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
        self.machine = Machine(model=self, states=states, transitions=transitions, initial='init')

        # define each callback function while entering each state
        self.machine.on_enter_init(self.init_callback)
        self.machine.on_enter_moving(self.moving_callback)

        # Init event post mechanism.
        self.event_post_instance = EventPost()
        self.event_post = self.event_post_instance.postEventToAllFSM

    def init_callback(self):
        pass

    def moving_callback(self):
        pass

def main():
    rospy.init_node('fsm_action_move')
    acion_move_fsm_instance = ActionMoveFSM()

    # Subscribe the topic of posting event to all FSM.
    rospy.Subscriber("event_publish", EventPublish, partial(event_receive_callback, acion_move_fsm_instance))
    rospy.spin()


if __name__ == '__main__':
    main()
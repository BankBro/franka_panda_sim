#!/usr/bin/env python

import rospy

from event_master import EventManager

from fsm_action_task_manage import ActionTaskManageFSM
from fsm_action_move import ActionMoveFSM
from fsm_action_queue import ActionQueueFSM


def main():
    rospy.init_node("fsm_start")
    
    acion_task_manage_fsm_instance = ActionTaskManageFSM()
    acion_move_fsm_instance = ActionMoveFSM()
    acion_queue_fsm_instance = ActionQueueFSM()

    event_manager = EventManager()
    event_manager.register_listener(acion_task_manage_fsm_instance)
    event_manager.register_listener(acion_move_fsm_instance)
    event_manager.register_listener(acion_queue_fsm_instance)

    rospy.spin()


if __name__ == "__main__":
    main()
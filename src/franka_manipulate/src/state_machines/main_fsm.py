#!/usr/bin/env python

from common import *

from fsm_action_task_manage import ActionTaskManageFSM
from fsm_action_move import ActionMoveFSM
from fsm_action_queue import ActionQueueFSM


def main():
    rospy.init_node("fsm_start")
    USR_REQ_DONE.clear()
    
    event_manager = EventManager()# TODO: 改成单例模式？
    acion_task_manage_fsm_instance = ActionTaskManageFSM(event_manager)
    acion_move_fsm_instance = ActionMoveFSM(event_manager)
    acion_queue_fsm_instance = ActionQueueFSM(event_manager)

    event_manager.register_listener(acion_task_manage_fsm_instance)
    event_manager.register_listener(acion_move_fsm_instance)
    event_manager.register_listener(acion_queue_fsm_instance)

    # publish services
    rospy.Service("exec_usr_req_service", ExecUsrReq, exec_usr_req_callback, event_manager)
    rospy.spin()


if __name__ == "__main__":
    main()
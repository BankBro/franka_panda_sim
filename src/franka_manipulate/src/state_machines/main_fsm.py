#!/usr/bin/env python

from common import *

from fsm_action_task_manage import ActionTaskManageFSM
from fsm_action_move import ActionMoveFSM
from fsm_action_queue import ActionQueueFSM

from typing import Dict


def on_shotdown(event_manager: EventManager, fsm_dict: Dict[str, ActionTaskManageFSM]):
    for fsm in fsm_dict.values():
        fsm.stop()

    event_manager.stop()
    return

def main():
    rospy.init_node("fsm_start")
    USR_REQ_DONE.clear()
    
    event_manager = EventManager()
    fsm_dict = {
        "action_task_manage": ActionTaskManageFSM(event_manager),
        "action_move": ActionMoveFSM(event_manager),
        "action_queue": ActionQueueFSM(event_manager),
    }
    event_manager.register_listener(fsm_dict)

    # publish services
    rospy.Service("exec_usr_req_service", ExecUsrReq, exec_usr_req_callback, event_manager)

    rospy.on_shotdown(on_shotdown(event_manager, fsm_dict))
    rospy.spin()


if __name__ == "__main__":
    main()
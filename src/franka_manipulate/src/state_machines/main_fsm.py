#!/usr/bin/env python

from common import *

from fsm_action_task_manage import ActionTaskManageFSM
from fsm_action_move import ActionMoveFSM
# from fsm_action_queue import ActionQueueFSM


def main():
    rospy.init_node("fsm_start")
    USR_REQ_DONE.clear()
    
    event_manager = EventManager()
    fsm_dict = {
        "action_task_manage": ActionTaskManageFSM(event_manager),
        "action_move": ActionMoveFSM(event_manager),
        # "action_queue": ActionQueueFSM(event_manager),
    }
    # register fsm instance as event master's listener
    event_manager.register_listener(fsm_dict)

    # publish services
    rospy.Service("exec_usr_req_service", ExecUsrReq, lambda req: exec_usr_req_callback(req, event_manager))
    rospy.loginfo("Service(exec_usr_req_service) start.")

    rospy.on_shutdown(lambda: on_shutdown(event_manager, fsm_dict))
    rospy.spin()


if __name__ == "__main__":
    main()
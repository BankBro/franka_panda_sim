#!/usr/bin/env python
import rospy

from common import EventManager, exec_usr_req_callback, on_shutdown, register_global_vars
from fsm_action_task_manage import ActionTaskManageFSM
from fsm_action_move import ActionMoveFSM
from global_vars import global_vars

from franka_manipulate.srv import ExecUsrReq

def main():
    rospy.init_node("fsm_action")
    register_global_vars()

    usr_req_done = global_vars.get("USR_REQ_DONE")
    usr_req_done.clear()
    
    event_manager = EventManager()
    fsm_dict = {
        "action_task_manage": ActionTaskManageFSM(event_manager),
        "action_move": ActionMoveFSM(event_manager),
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
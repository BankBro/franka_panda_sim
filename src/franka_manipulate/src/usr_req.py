#!/usr/bin/env python

import rospy
from franka_manipulate.srv import (
    ExecUsrReq,
    ExecUsrReqRequest,
    ExecUsrReqResponse
)


def exec_usr_req(exec_usr_req_service):
    rospy.wait_for_service("exec_usr_req_service")
    request = ExecUsrReqRequest()
    request.model_name = "openVLA"
    request.instruction = "Please put the red obj in the yellow box."
    request.unnorm_key = "bridge_orig"
    rospy.loginfo(f"Usr request({request}).")

    ret = exec_usr_req_service(request)
    rospy.loginfo(f"Usr request's ret({ret}).")
    return

def main():
    rospy.init_node("test_node")
    exec_usr_req_service = rospy.ServiceProxy("exec_usr_req_service", ExecUsrReq)

    exec_usr_req(exec_usr_req_service)
    return


if __name__ == "__main__":
    main()
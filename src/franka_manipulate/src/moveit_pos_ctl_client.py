#! /usr/bin/env python

import rospy
import math
from franka_manipulate.srv import MoveitPosCtl, MoveitPosCtlRequest, MoveitPosCtlResponse


def moveit_pos_ctl_client():
    rospy.loginfo("Waiting for moveit_pos_ctl service...")
    rospy.wait_for_service("moveit_pos_ctl")

    try:
        service = rospy.ServiceProxy("moveit_pos_ctl", MoveitPosCtl)

        request = MoveitPosCtlRequest()
        request.x = 0.2
        request.y = 0.5
        request.z = 0.1
        request.yaw = math.pi / 4
        request.pitch = math.pi
        request.roll = math.pi / 3

        response:MoveitPosCtlResponse = service(request)
        return response.go_ret
    
    except rospy.ServiceException as e:
        rospy.logerr(f"Service call failed: {e}")


if __name__ == "__main__":
    rospy.init_node("moveit_pos_ctl_client")
    
    ret = moveit_pos_ctl_client()
    rospy.loginfo(f"moveit_pos_ctl service call returned: {ret}")
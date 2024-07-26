#! /usr/bin/env python

import rospy
import math
import random
from franka_manipulate.srv import MoveitPosCtl, MoveitPosCtlRequest, MoveitPosCtlResponse

def exec_action(service, request):
    try:
        # request = MoveitPosCtlRequest()
        # request.x = 0.2
        # request.y = 0.5
        # request.z = 0.1
        # request.roll = math.pi / 3
        # request.pitch = math.pi
        # request.yaw = math.pi / 4

        response: MoveitPosCtlResponse = service(request)
        return response.go_ret

    except rospy.ServiceException as e:
        rospy.logerr(f"Service call failed: {e}")

def moveit_pos_ctl_client():
    service = rospy.ServiceProxy("moveit_pos_ctl_service", MoveitPosCtl)
    rospy.loginfo("Waiting for moveit_pos_ctl_service service...")
    rospy.wait_for_service("moveit_pos_ctl_service")

    while True:
        request = MoveitPosCtlRequest()
        request.x = random.uniform(-0.5, 0.5)
        request.y = random.uniform(-0.5, 0.5)
        request.z = random.uniform(0.05, 0.5)
        request.roll = random.uniform(-math.pi, math.pi)
        request.pitch = random.uniform(-math.pi, math.pi)
        request.yaw = random.uniform(-math.pi, math.pi)
        ret = exec_action(service, request)

        rospy.sleep(4)


if __name__ == "__main__":
    rospy.init_node("moveit_pos_ctl_client")

    ret = moveit_pos_ctl_client()
    rospy.loginfo(f"moveit_pos_ctl service call returned: {ret}")

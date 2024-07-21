#!/usr/bin/env python

import rospy
import sys
import math
import moveit_commander

from geometry_msgs.msg import PoseStamped
from franka_manipulate.srv import MoveitPosCtl, MoveitPosCtlRequest, MoveitPosCtlResponse

from tf.transformations import quaternion_from_euler, euler_from_quaternion


class MoveitPositionController:
    def __init__(self, reference_frame: str = "world"):
        # initialize move_group
        moveit_commander.roscpp_initialize(sys.argv)

        # initialize node
        rospy.init_node('moveit_target_pos', anonymous=True)

        # initialize group arm
        self.arm = moveit_commander.MoveGroupCommander("arm")

        # get end effector link
        self.end_effector_link = self.arm.get_end_effector_link()

        # set reference frame
        self.reference_frame = reference_frame
        self.arm.set_pose_reference_frame(self.reference_frame)
        self.arm.allow_replanning(True)

        # set tolerance
        self.arm.set_goal_orientation_tolerance(0.01)
        self.arm.set_goal_position_tolerance(0.05)

        self.arm_go_named_target("home")

    def arm_go_named_target(self, target_name: str = "home"):
        self.arm.set_named_target(target_name)
        self.arm.go()
        # rospy.sleep(1)

    def get_target_pose(self):
        return

    def arm_go_target_pos(self, request: MoveitPosCtlRequest):
        # set target pose
        target_pose = PoseStamped()
        target_pose.header.frame_id = self.reference_frame
        target_pose.header.stamp = rospy.Time.now()

        target_pose.pose.position.x = request.x
        target_pose.pose.position.y = request.y
        target_pose.pose.position.z = request.z

        quaternion = quaternion_from_euler(request.yaw, request.pitch, request.roll, axes='sxyz')
        target_pose.pose.orientation.x = quaternion[0]
        target_pose.pose.orientation.y = quaternion[1]
        target_pose.pose.orientation.z = quaternion[2]
        target_pose.pose.orientation.w = quaternion[3]

        # set start and target pose and execute
        self.arm.set_start_state_to_current_state()
        self.arm.set_pose_target(target_pose, self.end_effector_link)
        time_start = rospy.get_time()
        go_ret = self.arm.go()
        time_end = rospy.get_time()
        rospy.loginfo(f"exec time: {time_end - time_start}")

        if not go_ret:
            rospy.logerr(f"Failed to go to target, pose: {request.x, request.y, request.z}, \
                         rot: {request.yaw, request.pitch, request.roll}.")
        return MoveitPosCtlResponse(go_ret)

    def get_arm_target_trajectory(self, pos: list, rot: list):
        return


if __name__ == "__main__":
    pos_ctl = MoveitPositionController()
    rospy.Service('moveit_pos_ctl_service', MoveitPosCtl, pos_ctl.arm_go_target_pos)
    rospy.loginfo("moveit_pos_ctl_service service is ready.")
    rospy.spin()

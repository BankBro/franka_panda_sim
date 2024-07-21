#! /usr/bin/env python

import rospy
import threading

from franka_predict_action.srv import StoreNewActionToQueue, StoreNewActionToQueueRequest, StoreNewActionToQueueResponse
from franka_predict_action.srv import FetchSingleActionFromQueue, FetchSingleActionFromQueueResponse
from franka_manipulate.srv import UnitTask, UnitTaskRequest, UnitTaskResponse


class UnitTaskManage():
    def __init__(self):
        self.store_new_action_service = rospy.ServiceProxy("store_new_action_to_queue_service", StoreNewActionToQueue)
        self.fetch_single_action_service = rospy.ServiceProxy("fetch_single_action_from_queue_service", FetchSingleActionFromQueue)

        # rospy.Subscriber("/franka_end_effector/cur_status", EndEffectorStaus, self.handle_end_effector_status)
        rospy.Service("unit_task_manage_service", UnitTask, self.handle_unit_task_manage_service)

    def handle_unit_task_manage_service(self, request:UnitTaskRequest):
        modle_name = request.model_name
        instruction = request.instruction
        unnorm_key = request.unnorm_key

        # fetch an action from queue and then to execute it
        response:FetchSingleActionFromQueueResponse = self.fetch_single_action_service()

        if response

def main():
    rospy.init_node("unit_task_manage")
    UnitTaskManage()

    rospy.spin()



if __name__ == "__main__":
    main()
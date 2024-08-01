#! /usr/bin/env python
from typing import Tuple

import rospy
import queue
import threading

from franka_predict_action.srv import (
    PredictAction,
    PredictActionRequest,
    PredictActionResponse,
)
from franka_predict_action.srv import (
    StoreNewActionToQueue,
    StoreNewActionToQueueRequest,
    StoreNewActionToQueueResponse,
)
from franka_predict_action.srv import (
    FetchSingleAction,
    FetchSingleActionResponse,
)
from franka_predict_action.srv import (
    ClearActionQueue,
    ClearActionQueueResponse,
)


class ActionQueueManage():
    def __init__(self):
        self.action_queue = queue.Queue(maxsize=100)
        self.action_queue_mutex = threading.Lock()

        # Subscribe service of action prediction, to get and store predict actions.
        self.predict_action_service = rospy.ServiceProxy(rospy.get_param("~prediction_service"), PredictAction)

        # Publish service.
        rospy.Service(rospy.get_param("~store_new_action"), StoreNewActionToQueue, self._handle_store_new_action)
        rospy.Service(rospy.get_param("~fetch_single_action"), FetchSingleAction, self._handle_fetch_single_action)
        rospy.Service("clear_action_queue_service", ClearActionQueue, self._handle_clear_action_queue)

        rospy.loginfo("Action queue manage is ready.")

    @staticmethod
    def _get_action_list_from_flatten(action_shape: list, action_flat: list) -> list:
        action_list = []

        for i in range(action_shape[0]):
            action_list.append(action_flat[i * action_shape[1]: (i + 1) * action_shape[1]])

        return action_list

    def _get_predict_action(self, model_name: str, instruction: str, unnorm_key: str, source_action: list) -> Tuple[bool, list]:
        request = PredictActionRequest()
        request.model_name = model_name
        request.instruction = instruction
        request.unnorm_key = unnorm_key
        request.source_action = source_action

        # Call predict server to get actions.
        rospy.wait_for_service(
            rospy.get_param("~prediction_service")
        )
        response: PredictActionResponse = self.predict_action_service(request)

        # If predict succeed, get action_list.
        predict_succeed = response.predict_ret
        if predict_succeed:
            action_shape = response.action_shape
            action_flat = response.action_flat
            action_list = ActionQueueManage._get_action_list_from_flatten(action_shape, action_flat)

        else:
            rospy.logerr(
                f"Predict action failed! With model name: {model_name}, "
                f"instruction: {instruction}, unnorm_key: {unnorm_key}"
            )
            action_list = None

        return predict_succeed, action_list

    def _handle_store_new_action(self, request: StoreNewActionToQueueRequest):
        model_name = request.model_name
        instruction = request.instruction
        unnorm_key = request.unnorm_key
        source_action =  request.source_action
        response = StoreNewActionToQueueResponse()

        _, action_list = self._get_predict_action(model_name, instruction, unnorm_key, source_action)
        if action_list is None:
            rospy.logerr(f"Store new action failed!")
            response.store_ret = False
            return response

        # Put action_list into queue.
        self.action_queue_mutex.acquire()

        try:
            for act in action_list:
                self.action_queue.put(act)
            response.store_ret = True
        except queue.Full:
            rospy.logerr(f"Action queue is full!")
            response.store_ret = False
        finally:
            self.action_queue_mutex.release()

        return response

    def _handle_fetch_single_action(self, _):
        response = FetchSingleActionResponse()

        self.action_queue_mutex.acquire()

        if self.action_queue.empty():
            rospy.logerr(f"Action queue is empty!")
            response.fetch_ret = False
        else:
            action = self.action_queue.get()

            response.fetch_ret = True
            response.action = action
            response.queue_size = self.action_queue.qsize()
        
        self.action_queue_mutex.release()

        return response
    
    def _handle_clear_action_queue(self, _):

        self.action_queue_mutex.acquire()
        self.action_queue.queue.clear()
        self.action_queue_mutex.release()

        response = ClearActionQueueResponse()
        response.clear_ret = True
        return response


def main():
    rospy.init_node("action_queue_manage")
    ActionQueueManage()
    rospy.spin()


if __name__ == "__main__":
    main()

#! /usr/bin/env python

import rospy
import requests
import json_numpy

json_numpy.patch()
import numpy as np
import threading
from itertools import chain
from cv_bridge import CvBridge, CvBridgeError

from sensor_msgs.msg import Image as RosImage
from franka_predict_traj.srv import (
    PredictAction,
    PredictActionRequest,
    PredictActionResponse,
)


class ImageSubscriber():
    def __init__(self) -> None:
        self.last_img_np = None
        self.img_mutex = threading.Lock()
        self.bridge = CvBridge()

        # Subscribe to the image topic.
        self.subscribe_topic = rospy.get_param("~third_view_rgb")
        rospy.Subscriber(self.subscribe_topic, RosImage, self.handle_third_view_image)

    def handle_third_view_image(self, rgb_image: RosImage):
        self.img_mutex.acquire()
        try:
            self.last_img_np = self.bridge.imgmsg_to_cv2(rgb_image, "rgb8")
        except CvBridgeError as e:
            rospy.logerr(e)
            raise
        finally:
            self.img_mutex.release()

    def get_third_view_image(self):
        self.img_mutex.acquire()
        latest_img = self.last_img_np
        self.img_mutex.release()
        return latest_img


class PredictActionServer():
    def __init__(self, img_subscriber: ImageSubscriber):
        self.img_subscriber = img_subscriber
        self.handle_predict_action_tbl = {
            "openVLA": self.handle_send_req_to_openvla,
            "octo": self.handle_send_req_to_octo,
        }
        self.predict_action = rospy.get_param("~prediction_service")
        rospy.Service(self.predict_action, PredictAction, self.handle_predict_action)

    def handle_predict_action(self, request: PredictActionRequest) -> PredictActionResponse:
        model_name = request.model_name
        instruction = request.instruction
        unnorm_key = request.unnorm_key

        response: PredictActionResponse = PredictActionRequest()

        # Get image from image subscriber.
        img = self.img_subscriber.get_third_view_image().astype(np.uint8)

        # Send request to server according to model name.
        action = self.handle_predict_action_tbl[model_name](img, instruction, unnorm_key)

        # Check if action is legal or not.
        if not isinstance(action, list):
            rospy.logerr("Action is not a list! Request to server failed!")
            response.predict_ret = False
        else:
            # Flatten the action list, requiring that the action is a two-dimensional list.
            response.predict_ret = True
            response.action_shape[0] = len(action)
            response.action_shape[1] = len(action[0])
            response.action_flat = list(chain.from_iterable(action))
            assert len(response.action_flat) == response.action_shape[0] * response.action_shape[1], \
                "Action shape is not correct!"

        return response

    def handle_send_req_to_openvla(self, img: np.ndarray, instruction: str = None, unnorm_key: str = None):
        # Send request to openvla server to get prediction and decode json.
        try:
            # TODO: 这里只返回action吗？有没有返回错误码什么的吗？
            ip_address = rospy.get_param("~server_address")
            action = requests.post(
                ip_address,
                json={
                    "image": img,
                    "instruction": instruction,
                    "unnorm_key": unnorm_key
                }
            ).json()
        except requests.exceptions.RequestException as e:
            rospy.logerr(e)
            raise
        else:
            return action

    def handle_send_req_to_octo(self, img: np.ndarray, instruction: str = None, unnorm_key: str = None):
        pass


def main():
    rospy.init_node('predict_action_server')
    img_subscriber = ImageSubscriber()
    PredictActionServer(img_subscriber)
    rospy.spin()


if __name__ == '__main__':
    main()

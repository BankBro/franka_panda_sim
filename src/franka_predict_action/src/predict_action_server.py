#! /usr/bin/env python

import rospy
import requests
import json
import json_numpy
json_numpy.patch()
import traceback
import numpy as np
import threading
from itertools import chain

from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image as RosImage
from franka_predict_action.srv import (
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
        rospy.loginfo(f"Subscribed to {self.subscribe_topic}")

    def handle_third_view_image(self, rgb_image: RosImage):
        self.img_mutex.acquire()
        try:
            self.last_img_np = self.bridge.imgmsg_to_cv2(rgb_image, "rgb8")
        # except CvBridgeError as e:
        except Exception as e:
            rospy.logerr("Traceback:\n" + ''.join(traceback.format_tb(e.__traceback__)))
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
        rospy.loginfo(f"Prediction action service{self.predict_action} is ready.")

    def _change_delta_action_to_abs(self, delta_action, source_action):
        abs_action = []

        for i in range(len(delta_action)):
            abs_action.append([])
            for j in range(6):
                abs_action[i].append(delta_action[i][j] + source_action[j])
        
        return abs_action
    
    def handle_predict_action(self, request: PredictActionRequest) -> PredictActionResponse:
        model_name = request.model_name
        instruction = request.instruction
        unnorm_key = request.unnorm_key
        source_action = request.source_action

        response = PredictActionResponse()

        # Get image from image subscriber.
        img = self.img_subscriber.get_third_view_image().astype(np.uint8)

        # Send request to server according to model name.
        delta_action = self.handle_predict_action_tbl[model_name](img, instruction, unnorm_key)
        abs_action = self._change_delta_action_to_abs(delta_action, source_action)

        # Check if action is legal or not.
        if not isinstance(abs_action, list):
            rospy.logerr("Action is not a list! Request to server failed!")
            response.predict_ret = False
        else:
            # Flatten the action list, requiring that the action is a two-dimensional list.
            response.predict_ret = True
            action_shape = [len(abs_action), len(abs_action[0])]
            response.action_shape = action_shape
            response.action_flat = list(chain.from_iterable(abs_action))
            assert len(response.action_flat) == response.action_shape[0] * response.action_shape[1], \
                "Action shape is not correct!"

        return response

    def handle_send_req_to_openvla(self, img: np.ndarray, instruction: str = None, unnorm_key: str = None):
        # Send request to openvla server to get prediction and decode json.
        try:
            ip_address = rospy.get_param("~server_address")
            json_data=json.dumps({"image": img,
                                  "instruction": instruction,
                                  "unnorm_key": unnorm_key})

            action = requests.post(
                ip_address,
                data=json_data,
                headers={"Content-Type": "application/json"}
            ).text

            action=json.loads(action)  # np.ndarray
            
            # If action is not np.ndarray, something went wrong.
            if not isinstance(action, np.ndarray):
                raise Exception("Action is not a numpy array! Request to server failed!")
            
            rospy.loginfo(f"Predict action({action}, type:{type(action)}) successfully.")
            return [action.tolist()]

        # except requests.exceptions.RequestException as e:
        except Exception as e:
            rospy.logerr("Traceback:\n" + ''.join(traceback.format_tb(e.__traceback__)))
            raise

    def handle_send_req_to_octo(self, img: np.ndarray, instruction: str = None, unnorm_key: str = None):
        pass


if __name__ == '__main__':
    rospy.init_node('predict_action_server')
    img_subscriber = ImageSubscriber()
    PredictActionServer(img_subscriber)
    rospy.spin()

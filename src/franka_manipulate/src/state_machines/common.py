#!/usr/bin/env python

import rospy
import threading
from transitions import Machine, MachineError

from tf.transformations import euler_from_quaternion

from tf2_ros import (
    Buffer,
    TransformListener,
    LookupException,
    ConnectivityException,
    ExtrapolationException
)


REQUEST_TO_CONTINUE = False
REQUEST_TO_CONTINUE_MUTEX = threading.Lock()

DURING_PREDICT_ACTION = False
DURING_PREDICT_ACTION_MUTEX = threading.Lock()

PREDICT_ACTION_DONE = threading.Event()  # default: False
ACTION_REACH_THRESHOLD = threading.Event()
CLEAR_ACTION_QUEUE_DONE = threading.Event()

SOURCE_POS = []
TARGET_POS = []
SOURCE_POS_MUTEX = threading.Lock()
TARGET_POS_MUTEX = threading.Lock()

ACTION_THRESHOLD = 0.35  # An action is considered reached threshold when:
                         # - The percentage of the distance between
                         #   the current position and the target position
                         #   is less than the value of ACTION_THRESHOLD.


class TFManager:
    _instance = None

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super(TFManager, cls).__new__(cls, *args, **kwargs)
            cls._instance._initialized = False
        return cls._instance

    def __init__(self):
        if not self._initialized:
            self.tf_buffer = Buffer()
            self.tf_listener = TransformListener(self.tf_buffer)
            self._initialized = True

    def get_link_pos(self, reference_frame, end_effector_link):
        try:
            trans = self.tf_buffer.lookup_transform(reference_frame,
                                                    end_effector_link,
                                                    rospy.Time(0),
                                                    rospy.Duration(1.0))
            
            position = trans.transform.translation
            orientation = trans.transform.rotation  # Quaternion
            return position, orientation
        
        except (LookupException, ConnectivityException, ExtrapolationException):
            rospy.logwarn(f"Failed to lookup transform of \"{self.end_effector_link}\".")
            return None, None
    
    def get_euler_from_quaternion(orientation):
        euler = euler_from_quaternion(orientation.x, orientation.y, orientation.z, orientation.w)
        return euler

def if_event_valid(fsm_instance, event):
    """
    To check if the event is in the state machine.
    """
    return any(transition['trigger'] == event for transition in fsm_instance.machine.get_transitions())

def send_event_to_fsm(fsm_instance, event: str):
    # if event is not one of FSM's trigger event.
    if not if_event_valid(fsm_instance, event):
        rospy.logwarn(f"event({event}) is not valid for FSM({fsm_instance.name})")
        return

    try:
        fsm_instance.trigger(event)
    except MachineError as e:
        rospy.logwarn(
            f"event({event}) is not allowed in current state({fsm_instance.state}) of FSM({fsm_instance.name})"
        )
    return
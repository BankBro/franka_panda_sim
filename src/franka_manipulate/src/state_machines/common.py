#!/usr/bin/env python

import rospy
import threading
from transitions import Machine, MachineError
from tf.transformations import euler_from_quaternion

from event_master import EventManager

from tf2_ros import (
    Buffer,
    TransformListener,
    LookupException,
    ConnectivityException,
    ExtrapolationException
)

from franka_manipulate.srv import (
    ExecUsrCmd,
    ExecUsrCmdRequest,
    ExecUsrCmdResponse
)


MAX_EXEC_TIME = 30
ACTION_THRESHOLD = 0.35  # An action is considered reached threshold when:
                         # - The percentage of the distance between
                         #   the current position and the target position
                         #   is less than the value of ACTION_THRESHOLD.

REFERENCE_FRAME = "world"
END_EFFECTOR_FRAME = "panda_grip_center"

REQ_MODEL_NAME = None
REQ_INSTRUCTION = None
REQ_UNNORM_KEY = None
REQ_INFO_MUTEX = threading.Lock()

DURING_PREDICT_ACTION = False
DURING_PREDICT_ACTION_MUTEX = threading.Lock()

USR_REQ_DONE = threading.Event()  # default: False
PREDICT_ACTION_DONE = threading.Event()
ACTION_REACH_THRESHOLD = threading.Event()
CLEAR_ACTION_QUEUE_DONE = threading.Event()

SOURCE_POS = []
TARGET_POS = []
SOURCE_POS_MUTEX = threading.Lock()
TARGET_POS_MUTEX = threading.Lock()


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

    def get_link_pos(self, reference_frame=REFERENCE_FRAME, end_effector_link=END_EFFECTOR_FRAME):
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
    
    def get_euler_from_quaternion(orientation) -> list:
        euler = euler_from_quaternion(orientation.x, orientation.y, orientation.z, orientation.w, axes='rxyz')
        return euler  # [roll, pitch, yaw]

def _if_event_valid(fsm_instance, event):
    """
    To check if the event is in the state machine.
    """
    return any(transition['trigger'] == event for transition in fsm_instance.machine.get_transitions())

def send_event_to_fsm(fsm_instance, event: str):
    # if event is not one of FSM's trigger event.
    if not _if_event_valid(fsm_instance, event):
        rospy.logwarn(f"event({event}) is not valid for FSM({fsm_instance.name})")
        return

    try:
        fsm_instance.trigger(event)
    except MachineError as e:
        rospy.logwarn(
            f"event({event}) is not allowed in current state({fsm_instance.state}) of FSM({fsm_instance.name})"
        )
    return

def _timer_callback():
    global USR_REQ_DONE
    USR_REQ_DONE.set()
    return

def _set_usr_req_info(model_name, instruction, unnorm_key):
    global REQ_MODEL_NAME
    global REQ_INSTRUCTION
    global REQ_UNNORM_KEY

    with REQ_INFO_MUTEX:
        REQ_MODEL_NAME = model_name
        REQ_INSTRUCTION = instruction
        REQ_UNNORM_KEY = unnorm_key

def exec_usr_cmd_callback(request: ExecUsrCmdRequest, event_manager: EventManager):
    # set a timer, when time out, stop exec user cmd
    timer = threading.Timer(MAX_EXEC_TIME, _timer_callback)
    timer.start()

    _set_usr_req_info(request.model_name, request.instruction, request.unnorm_key)
    event_manager.put_event_in_queue("usr_req")

    # wait for usr req done
    USR_REQ_DONE.wait()
    USR_REQ_DONE.clear()

    _set_usr_req_info(None, None, None)
    rospy.loginfo(f"User request has been done, model({request.model_name}), "
                  f"instruction({request.instruction}), unnorm_key({request.unnorm_key})")
    return
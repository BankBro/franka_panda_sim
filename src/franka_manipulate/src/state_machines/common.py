#!/usr/bin/env python

import rospy
import queue
import threading
from transitions import Machine, MachineError
from tf.transformations import euler_from_quaternion
from typing import Dict, Type

from event_master import EventManager

from tf2_ros import (
    Buffer,
    TransformListener,
    LookupException,
    ConnectivityException,
    ExtrapolationException
)

from franka_manipulate.srv import (
    ExecUsrReq,
    ExecUsrReqRequest,
    ExecUsrReqResponse
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

USR_REQ_DONE = threading.Event()  # default: False
DURING_PREDICT_ACTION = threading.Event()
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


class ThreadedStateMachine:
    def __init__(self, states, transitions, initial_state):
        self.name = None
        self.event_queue = queue.Queue()
        self.trigger_mutex = threading.Lock()

        self.machine = Machine(
            model=self,
            states=states,
            transitions=transitions,
            initial=initial_state
        )

        self.thread = threading.Thread(target=self._run, daemon=True)
        self.thread.start()
        return
    
    def _run(self):
        while not rospy.is_shutdown():
            event = self.event_queue.get(timeout=None)
            rospy.loginfo(f"FSM({self.name}), state({self.state}) received event({event}).")

            if event == "None":
                rospy.loginfo(f"Fsm({self.name}) got event(None), exit running...")
                break

            with self.trigger_mutex:
                rospy.loginfo(f"Fsm({self.name}), state({self.state}) starts to trigger event({event}).")
                self._trigger(event)
                rospy.loginfo(f"Fsm({self.name}), state({self.state}) execute event({event}) done.")
        return
    
    def _trigger(self, event: str):
        try:
            # check if the event is defined in the FSM
            if hasattr(self, event):
                # get and execute corresponding trigger function (synchronization)
                getattr(self, event)()
            else:
                rospy.logwarn(f"Fsm({self.name}), state({self.state}) does not have event({event}).")
        except Exception as e:
            rospy.logwarn(f"Exception occurred: {e}. Event({event}), Fsm({self.name}), state({self.state}).")
        return
    
    def put_event(self, event: str):
        """
        This function is used for putting event into specified fsm queue. 
        """
        self.event_queue.put(event)
        rospy.loginfo(f"Event({event}) has been put into queue of FSM({self.name}).")
        return
    
    def stop(self):
        rospy.loginfo(f"Put None event into FSM({self.name}) queue.")
        self.event_queue.put("None")
        self.thread.join()
        return


def _exec_usr_req_timer_callback():
    rospy.loginfo(f"User's request executes timeout({MAX_EXEC_TIME}s).")
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

def exec_usr_req_callback(request: ExecUsrReqRequest, event_manager: EventManager):
    rospy.loginfo(f"Start exec usr req callback.")
    # Set a timer, when timeout, stop execute user command.
    timer = threading.Timer(MAX_EXEC_TIME, _exec_usr_req_timer_callback)
    timer.start()
    rospy.loginfo(f"User request timer is ready, timeout({MAX_EXEC_TIME}s).")

    _set_usr_req_info(request.model_name, request.instruction, request.unnorm_key)
    event_manager.put_event_in_queue("usr_req")

    # wait for usr req done
    USR_REQ_DONE.wait()
    USR_REQ_DONE.clear()
    timer.cancel()

    _set_usr_req_info(None, None, None)
    rospy.loginfo(f"User request has been done, model({request.model_name}), "
                  f"instruction({request.instruction}), unnorm_key({request.unnorm_key})")
    
    return ExecUsrReqResponse(True)

def on_shutdown(event_manager: EventManager, fsm_dict: Dict[str, Type[ThreadedStateMachine]]):
    rospy.loginfo("Exit event master and all FSM.")
    for fsm in fsm_dict.values():
        fsm.stop()

    event_manager.stop()
    rospy.loginfo("Exit event master and all FSM successfully.")
    return
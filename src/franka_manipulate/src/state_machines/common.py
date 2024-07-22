#!/usr/bin/env python

import rospy
from transitions import MachineError

from franka_manipulate.msg import EventPublish
from franka_manipulate.srv import EventPostToServer, EventPostToServerRequest, EventPostToServerResponse


class EventPost():
    """
    This class is used to post event to all FSM.
    First, it will send event from one single FSM to event master by service.
    Then, the event master will post this event to all FSM by publish topic.
    """
    def __init__(self) -> None:
        # get the event master's service
        self.event_master = rospy.ServiceProxy("event_receive", EventPostToServer)
    def postEventToAllFSM(self, event: str):
        event_post = EventPostToServerRequest()
        event_post.event = event

        # Send the event to event master, which will then post this event to all FSM by topic.
        response: EventPostToServerResponse = self.event_master(event_post)
        return response.post_ret
    
def if_event_valid(state_machine, event):
    """
    To check if the event is in the state machine.
    """
    return any(transition['trigger'] == event for transition in state_machine.machine.get_transitions())

def event_receive_callback(msg: EventPublish, fsm_instance):
    """
    This callback function is suitable for all FSM while receiving event from event master.
    """
    event = msg.event

    # if event is not one of FSM's trigger event.
    if not if_event_valid(fsm_instance, event):
        rospy.logwarn(f"event({event}) is not valid")
        return
    
    try:
        fsm_instance.trigger(event)
    except MachineError as e:
        rospy.logwarn(
            f"event({event}) is not allowed in current state({fsm_instance.state}) of FSM({fsm_instance.name})"
        )
    return
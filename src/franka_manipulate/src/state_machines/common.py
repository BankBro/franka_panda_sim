#!/usr/bin/env python

import rospy
from franka_manipulate.srv import EventPostToServer, EventPostToServerRequest, EventPostToServerResponse


class EventPost():
    def __init__(self) -> None:
        self.event_transfer_station = rospy.ServiceProxy("event_receive", EventPostToServer)
    def postEventToAllFSM(self, event: str):
        event_post = EventPostToServerRequest()
        event_post.event = event

        response: EventPostToServerResponse = self.event_transfer_station(event_post)
        return response.post_ret
    
def if_event_valid(state_machine, event):
    return any(transition['trigger'] == event for transition in state_machine.machine.get_transitions())
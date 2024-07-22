#!/usr/bin/env python
import rospy
from franka_manipulate.srv import EventPostToServer, EventPostToServerRequest, EventPostToServerResponse

def postEventToAllFSM(event: str):
    receiver_service = rospy.ServiceProxy("event_receive", EventPostToServer)
    event_post = EventPostToServerRequest()
    event_post.event = event
    post_ret = receiver_service(event_post)
    return post_ret.post_ret

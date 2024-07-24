#!/usr/bin/env python

import rospy

from franka_manipulate.srv import EventPostToServer, EventPostToServerRequest, EventPostToServerResponse
from franka_manipulate.msg import EventPublish


class EventMaster:
    """
    This class is to receive event from one single FSM(by 'event_receive') 
    and post this event to all FSM(by 'event_publish').
    """
    def __init__(self):
        # Init event publisher, event from which is posted to all FSM.
        self.event_publisher = rospy.Publisher("event_publish", EventPublish, queue_size=10)

        # Init event receiver, whose event is from one single FSM.
        rospy.Service("event_receive", EventPostToServer, self.handle_event_post_to_all_FSM)

    def handle_event_post_to_all_FSM(self, request: EventPostToServerRequest) -> EventPostToServerResponse:
        event_publish = EventPublish()
        event_publish.event = request.event
        event_publish.event_time = rospy.Time.now()
        self.event_publisher.publish(event_publish)

        event_post = EventPostToServerResponse()
        event_post.post_ret = True
        return event_post


if __name__ == "__main__":
    rospy.init_node("event_master")
    EventMaster()
    rospy.spin()
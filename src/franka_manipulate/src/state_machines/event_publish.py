#!/usr/bin/env python

import rospy
from franka_manipulate.srv import EventPostToServer, EventPostToServerRequest, EventPostToServerResponse
from franka_manipulate.msg import EventPublish


class EventPublishServer:
    def __init__(self):
        # Init event receiver and publisher.
        self.event_receiver = rospy.Service("event_receive", EventPostToServer, self.handle_event_post_to_server)
        self.event_publisher = rospy.Publisher("event_publish", EventPublish, queue_size=10)

    def handle_event_post_to_server(self, request: EventPostToServerRequest) -> EventPostToServerResponse:
        event_publish = EventPublish()
        event_publish.event = request.event
        event_publish.event_time = rospy.Time.now()
        self.event_publisher.publish(event_publish)
        return EventPostToServerResponse()


if __name__ == "__main__":
    rospy.init_node("event_publish_server")
    EventPublishServer()
    rospy.spin()
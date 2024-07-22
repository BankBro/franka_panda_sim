#!/usr/bin/env python

import rospy
from franka_manipulate.srv import EventPostToServer, EventPostToServerRequest, EventPostToServerResponse
from franka_manipulate.msg import EventPublish


class EventPublishServer():
    def __init__(self):
        # receive event service
        self.event_receive = rospy.Service("event_receive", EventPostToServer, self.handle_event_post_to_server)

        # event publish topic
        self.event_publish = rospy.Publisher("event_publish", EventPublish, queue_size=10)

        self.event_publish_msg.event_type = "init"

    def handle_event_post_to_server(self, request: EventPostToServerRequest) -> EventPostToServerResponse:
        pass

def main():
    rospy.init_node("event_publish_server")
    event_publish_server = EventPublishServer()
    rospy.spin()

if __name__ == "__main__":
    main()
#!/usr/bin/env python

import rospy
import queue
import threading

from common import send_event_to_fsm

# class Listener:
#     def __init__(self, name: str, handle_event: Callable):
#         """
#         Initialize a Listener object.

#         :param name: A string representing the name of the listener.
#         :param handle_event: A callable function that will be invoked when an event broadcasted.
#         """
#         self.name = name
#         self.handle_event = handle_event


class EventManager():
    def __init__(self):
        self.event_queue = queue.Queue()
        self.listeners = []
        self.listeners_mutex = threading.Lock()
        self.running = threading.Event()  # broadcast thread running flag, default False
        self.broadcast_thread = None

        self.start()

    def start(self):
        """
        start the event broadcast thread
        """
        if not self.running.is_set():
            self.running.set()  # set flag as True
            self.broadcast_thread = threading.Thread(target=self._broadcast_event)
            self.broadcast_thread.start()

    def stop(self):
        """
        stop the event broadcast thread
        """
        self.running.clear()  # set flag as False
        if self.broadcast_thread and self.broadcast_thread.is_alive():
            self.broadcast_thread.join()

    def register_listener(self, listener):
        if listener not in self.listeners:
            with self.listeners_mutex:
                self.listeners.append(listener)
            rospy.loginfo(f"Registered listener: {listener.name}")

    def unregister_listener(self, listener):
        if listener in self.listeners:
            with self.listeners_mutex:
                self.listeners.remove(listener)
            rospy.loginfo(f"Unregistered listener: {listener.name}")

    def put_event_in_queue(self, event: str):
        """
        Put an event into the event queue.

        :param event: The event object to be broadcasted to all registered listeners.
        """
        if self.running.is_set():
            self.event_queue.put(event)

    def _broadcast_event(self):
        """
        Fetch event from queue and broadcast to all listeners by calling listener's callback.
        """
        while self.running.is_set():
            try:
                event = self.event_queue.get(timeout=None)

                self.listeners_mutex.acquire()
                for listener in self.listeners:
                    send_event_to_fsm(listener, event)
                self.listeners_mutex.release()

            finally:
                self.event_queue.task_done()
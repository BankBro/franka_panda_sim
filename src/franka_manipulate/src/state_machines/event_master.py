#!/usr/bin/env python

from common import *


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
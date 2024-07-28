#!/usr/bin/env python

from common import *


class EventManager():
    def __init__(self):
        self.event_queue = queue.Queue()
        self.listeners = []
        self.listeners_mutex = threading.Lock()
        self.running = threading.Event()  # broadcast thread running flag, default False
        self.broadcast_thread = None

        self._start()
        rospy.loginfo("Event master is ready.")
        return

    def _start(self):
        """
        start the event broadcast thread
        """
        if not self.running.is_set():
            self.running.set()  # set flag as True
            self.broadcast_thread = threading.Thread(target=self._broadcast_event)
            self.broadcast_thread.start()
        return

    # def stop(self):
    #     """
    #     stop the event broadcast thread
    #     """
    #     if self.broadcast_thread and self.broadcast_thread.is_alive():
    #         self.broadcast_thread.join()
    #         rospy.loginfo("Event master exit.")

    #     self.running.clear()  # set flag as False
    #     rospy.loginfo("Event master is not running no need to exit.")
    #     return
    
    def stop(self):
        """
        stop the event broadcast thread
        """
        self.event_queue.put("None")
        self.broadcast_thread.join()
        rospy.loginfo("Event master has exited.")
        return

    def register_listener(self, listener_dict):
        self.listeners_mutex.acquire()
        for name, listener in listener_dict.items():
            if listener not in self.listeners:
                self.listeners.append(listener)
                rospy.loginfo(f"Registered listener: {name}")
        self.listeners_mutex.release()
        rospy.loginfo("Register listeners have done.")
        return

    def unregister_listener(self, listener):
        self.listeners_mutex.acquire()
        if listener in self.listeners:
            self.listeners.remove(listener)
            rospy.loginfo(f"Unregistered listener: {listener.name}")
        self.listeners_mutex.release()
        return

    def put_event_in_queue(self, event: str):
        """
        Put an event into the event master queue.

        :param event: The event object to be broadcasted to all registered listeners.
        """
        if self.running.is_set():
            self.event_queue.put(event)
            rospy.loginfo(f"Put event({event}) into event master queue.")
        else:
            rospy.logwarn("EventManager is not running, cannot put event in queue.")
        return

    def _if_event_valid(self, fsm_instance, event):
        """
        To check if the event is in the state machine.
        """
        return any(transition['trigger'] == event for transition in fsm_instance.machine.get_transitions())

    def _send_event_to_fsm(self, fsm_instance, event: str):
        # if event is not one of FSM's trigger event.
        if not self._if_event_valid(fsm_instance, event):
            rospy.logwarn(f"Event({event}) is not valid for FSM({fsm_instance.name}).")
            return

        try:
            fsm_instance.trigger_event(event)  # non-blocking
        except MachineError as e:
            rospy.logwarn(
                f"Event({event}) is not allowed in current state({fsm_instance.state}) of FSM({fsm_instance.name})."
            )
        return
    
    def _broadcast_event(self):
        """
        Fetch event from queue and broadcast to all listeners by calling listener's callback.
        """
        rospy.loginfo("Event master is broadcasting event...")
        while self.running.is_set():
            try:
                event = self.event_queue.get(timeout=None)
                rospy.loginfo(f"Got one event from event master queue: {event}.")

                if event == "None":
                    self.running.clear()  # set flag as False
                    break

                self.listeners_mutex.acquire()
                for listener in self.listeners:
                    self._send_event_to_fsm(listener, event)
                    rospy.loginfo(f"Broadcasted event({event}) to listener: {listener.name}.")
                self.listeners_mutex.release()

            except:
                rospy.loginfo("Broadcast occur error.")

            finally:
                self.event_queue.task_done()
        rospy.loginfo("Event master exit.")
        return
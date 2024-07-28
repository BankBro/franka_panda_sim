from transitions import Machine
import queue
import threading
import time

class ExampleStateMachine:
    states = [
        {'name': 'state1', 'on_enter': 'on_enter_state1'},
        {'name': 'state2', 'on_enter': 'on_enter_state2'},
        {'name': 'state3', 'on_enter': 'on_enter_state3'}
    ]

    def __init__(self):
        self.name = "ExampleFSM"
        self.event_queue = queue.Queue()
        self.trigger_mutex = threading.Lock()

        transitions = [
            {'trigger': 'event1', 'source': 'state1', 'dest': 'state2', 'before': 'before_event', 'after': 'after_event'},
            {'trigger': 'event1', 'source': 'state2', 'dest': 'state3', 'before': 'before_event', 'after': 'after_event'},
        ]

        self.machine = Machine(model=self, states=ExampleStateMachine.states, transitions=transitions, initial='state1')

        self.thread = threading.Thread(target=self._run, daemon=True)
        self.thread.start()
        print("Thread init finish.")

    def stop(self):
        self.thread.join()

    def _run(self):
        print("Thread run.")
        while True:
            print("Start to get event.")
            event = self.event_queue.get(timeout=None)
            print("Got event: ", event)
            if event == "None":
                print(f"Fsm({self.name}) got a \"None\" event, breaking running...")
                break

            with self.trigger_mutex:
                print(f"----------------Fsm({self.name}) starts to trigger event({event}).")
                self.trigger(event)
                print(f"----------------Fsm({self.name}) triggers event({event}) done.")
        print("Stop running.")
        return

    def trigger(self, event: str):
        try:
            if hasattr(self, event):
                method = getattr(self, event)  # 同步的，需要等待on_enter钩子函数
                return_value = method()
                print(f"Return value of the event '{event}': {return_value}")
            else:
                print(f"Event({event}) is not defined for FSM({self.name}).")
        except AttributeError:
            print(f"Event({event}) is not allowed in current state({self.state}) of FSM({self.name}).")
        return
    
    # before 钩子函数示例
    def before_event(self):
        print("Before event")
        return 123

    # after 钩子函数示例
    def after_event(self):
        print("After event")
        return 456

    # on_enter 钩子函数示例
    def on_enter_state1(self):
        print("Entering state1")
        time.sleep(5)
        return "entered_state1"

    def on_enter_state2(self):
        print("Entering state2")
        time.sleep(5)
        return "entered_state2"

    def on_enter_state3(self):
        print("Entering state3")
        time.sleep(5)
        return "entered_state3"

# 创建状态机实例并触发事件
fsm = ExampleStateMachine()
print("put event1")
fsm.event_queue.put('event1')
print("put event1")
fsm.event_queue.put('event1')
print("put event None")
fsm.event_queue.put('None')

fsm.stop()

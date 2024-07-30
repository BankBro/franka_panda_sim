import queue

event_queue = queue.Queue()

event = event_queue.get()

print(f"event: {event}")

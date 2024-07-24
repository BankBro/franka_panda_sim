#!/usr/bin/env python

import threading
from time import sleep

semaphore = threading.Semaphore(3)

def worker():
    semaphore.acquire()
    print(f"Worker: {threading.current_thread()} sleep for 5 seconds...")
    sleep(5)
    semaphore.release()

threads = []
for i in range(5):
    t = threading.Thread(target=worker)
    threads.append(t)
    t.start()

print("all threads is init done")

for t in threads:
    t.join()

print("end")
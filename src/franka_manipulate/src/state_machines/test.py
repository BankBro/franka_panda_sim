#!/usr/bin/env python

from transitions import Machine
import time
import threading

class Device:
    def __init__(self, name):
        self.name = name

    def on_enter_on(self):
        print(f"{self.name} is now entering 'on' state")
        # 模拟长时间的状态处理
        time.sleep(5)
        print(f"{self.name} has finished entering 'on' state")

    def on_enter_off(self):
        print(f"{self.name} is now entering 'off' state")
        # 模拟长时间的状态处理
        time.sleep(5)
        print(f"{self.name} has finished entering 'off' state")

# 定义状态和事件
states = ['off', 'on']
transitions = [
    {'trigger': 'turn_on', 'source': 'off', 'dest': 'on'},
    {'trigger': 'turn_off', 'source': 'on', 'dest': 'off'}
]

# 创建状态机实例
device = Device("Device")
machine = Machine(model=device, states=states, transitions=transitions, initial='off')

# 测试状态机行为
print(f"Current state after turning on: {device.state}")
device.turn_on_test()
print(f"Current state after turning on: {device.state}")  # 输出: on
# time.sleep(1)

# print()

# print(f"Current state after turning on: {device.state}")
# device.turn_off_test()
# print(f"Current state after turning off: {device.state}")  # 输出: off

# print()
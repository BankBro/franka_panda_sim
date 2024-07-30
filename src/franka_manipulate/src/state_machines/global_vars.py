#!/usr/bin/env python

import threading


class GlobalVars:
    def __init__(self):
        self.vars = {}
        return

    def register_variable(self, name: str, initial_value=None, with_lock=True):
        if name in self.vars:
            raise Exception(f"Variable({name}) already registered.")
        
        if with_lock:
            lock = threading.Lock()
        else:
            lock = None

        self.vars[name] = {'value': initial_value, 'lock': lock}
        return

    def get(self, name: str):
        if name not in self.vars:
            raise Exception(f"Variable({name}) not registered.")
        
        lock = self.vars[name]['lock']
        if lock is not None:
            with lock:
                value = self.vars[name]['value']
        else:
            value = self.vars[name]['value']
        return value
    
    def set(self, name: str, value):
        if name not in self.vars:
            raise Exception(f"Variable({name}) not registered.")
        
        lock = self.vars[name]['lock']
        if lock is not None:
            with lock:
                self.vars[name]['value'] = value
        else:
            self.vars[name]['value'] = value
        return


global_vars = GlobalVars()
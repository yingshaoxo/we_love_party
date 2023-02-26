#!/usr/bin/env /usr/bin/python3

# Run this to generate bash auto complete script: Tools -- --completion

import os, re
import random
from auto_everything.python import Python
from auto_everything.terminal import Terminal

from pprint import pprint

py = Python()
t = Terminal(debug=True)

def itIsWindows():
    if os.name == 'nt':
        return True
    return False

class Tools():
    def help(self):
        print(help(Tools))
    
    def hi(self):
        self.help()

    def start(self):
        t.run("code we_love_party")

    def build_protocols(self):
        pass
    
    def build_python_protocols(self):
        pass

py.make_it_global_runnable(executable_name="development_tools_party")
py.fire(Tools)

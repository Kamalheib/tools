#!/usr/bin/env python

import os
import sys

if __name__ == "__main__":

    if sys.argv[1] == "laptop":
        os.system("xrandr -s 1360x768")

    elif sys.argv[1] == "lcd":
        os.system("xrandr -s 1680x1050")

    elif sys.argv[1] == "mac":
        os.system("xrandr -s 1280x800")

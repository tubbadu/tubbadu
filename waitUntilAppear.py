#!/usr/bin/python3
import sys
import os
import subprocess
import time

try:
	processName = sys.argv[1]
except:
	exit("Error: you must specify a process to wait for.")

try:
	timeout = float(sys.argv[2])
except:
	timeout = 5 #seconds

def bash(cmd, read=False):
	if read:
		try:
			x = subprocess.check_output(cmd, shell=True).decode("utf-8")
		except:
			x = False
		return x
	else:
		os.system(cmd)
		return

def getActiveWindow():
	output = bash("xdotool getwindowfocus getwindowname", read=True)
	if("-" in output):
		activeWindowName = output.split("-")[1].strip()
	elif ("—" in output):
		activeWindowName = output.split("—")[1].strip()
	else:
		activeWindowName = output
	print("<" + activeWindowName + ">")
	return activeWindowName


t_end = time.time() + timeout
while time.time() < t_end:
	if(getActiveWindow() == processName):
		exit("now active:" + processName )
exit("timemout")

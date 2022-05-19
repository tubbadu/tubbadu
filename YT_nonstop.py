#!/usr/bin/python3

import pyautogui
from time import sleep
t = 1000
print("Running YT nonStop!")
n=1
while(True):
	sleep(t-1)
	print(f"executing {n}° refresh")
	n+=1
	pyautogui.press('Down')
	sleep(1)
	pyautogui.press('Up') 

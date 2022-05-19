#!/usr/bin/python
from time import sleep
import pyautogui
img = None
# img = '/home/tubbadu/Documenti/tempi_difficili.png'

while True:
	currentMouseX, currentMouseY = pyautogui.position()
	print(currentMouseX, currentMouseY)
	if img != None:
		pos = pyautogui.locateOnScreen(img)
		print('pos', pos)
		if pos != None:
			x, y, _, _ = pos

	# sleep(0.2)

#!/usr/bin/python3
from PyQt5.QtWidgets import *
import subprocess

c1 = '😂'
c2 = '🥺'

def xdotool(ch):
    subprocess.call(["xdotool", "type", str(ch)])


app = QApplication([])
window = QWidget()
window.setWindowTitle("pipi")

b1 = QPushButton(c1)
b2 = QPushButton(c2)

def B1():
    xdotool(c1)

def B2():
    xdotool(c2)

b1.clicked.connect(B1)
b2.clicked.connect(B2)

layout = QHBoxLayout()
layout.addWidget(b1)
layout.addWidget(b2)

window.setLayout(layout)
window.show()

app.exec_()

exit()


import tkinter as tk
import os
import subprocess
import pyautogui
import pyperclip

e1="\U0001F600" #😂🥺🥺😂😂
e2=u'😂'
e3="\U0001f600"
e4='👀'




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

def xdotool(ch):
    subprocess.call(["xdotool", "type", str(ch)])

root = tk.Tk()
root.geometry("300x200") 

def write(Str):
	xdotool(Str)

def b1():
  	write(e1)

def b2():
	write(e2)

def b3():
  	write(e3)

def b4():
  	write(e4)

B1 = tk.Button(root, text=e1, command = b1)
B1.grid(row = 1, column = 1)

B2 = tk.Button(root, text=e2, command = b2)
B2.grid(row = 1, column = 2)

B3 = tk.Button(root, text=e3, command = b3)
B3.grid(row = 1, column = 3)

B4 = tk.Button(root, text=e4, command = b4)
B4.grid(row = 1, column = 4)



root.mainloop()
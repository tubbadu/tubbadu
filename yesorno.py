#!/usr/bin/python3
import sys
import os
import subprocess
from tkinter import * 

question = sys.argv[1]

cmdyes = sys.argv[2]

try:
	cmdno = sys.argv[3]
except:
	cmdno = "echo 'aborted.'"

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

def ifYes():
	bash(cmdyes)
	exit()

def ifNo():
	bash(cmdno)
	exit()
 
# create a tkinter window
root = Tk()
root.eval('tk::PlaceWindow . center')

frame1 = Frame(root)
frame2 = Frame(root)

# Open window having dimension 100x100
#root.geometry('100x100')
 
# Create a Button
label = Label(frame1, text=question)

yes = Button(frame2, text = 'Yes', bd = '5', width=2, command = ifYes)
no  = Button(frame2, text = 'No ', bd = '5', width=2, command = ifNo)
 
# Set the position of button on the top of window.  
yes.pack(side = 'left')   
no.pack(side = 'right')   
label.pack(side = 'top')

frame1.pack(padx=1,pady=1)
frame2.pack(padx=10,pady=10)

root.mainloop()


from glob import glob
import os, subprocess
from tkinter import *
from tkinter import ttk, StringVar
from tkinter.tix import *


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


def getMetadata(f):
    try:
        metadata = bash(f"exiftool -H '{f}'", read=True).strip().split('\n')
        for data in metadata:
            data = data.strip().split(" : ")
            for d in data:
                print(d)
        print("\n\n\n-------------------------------------\n\n\n")
    except:
        pass

cwd = os.getcwd()
flist = glob(cwd + "/*")
#print(flist)

for f in flist:
    getMetadata(f)

exit()
'''window = Tk()
window.title("MetaEdit")
window.geometry('400x400')
scroll = Scrollbar(window, orient='vertical')
scroll.config(command=window.yview)'''


#window.configure(background = "grey")
root = Tk()
#root.iconbitmap(default='icon.ico')
root.wm_title('Got Skills\' Skill Tracker')
frame = Frame(width="500",height="500")
frame.pack()
swin = ScrolledWindow(frame, width=500, height=500)

swin.pack()
window = swin.window

def mouse_wheel(event):
    print(event)
    # respond to Linux or Windows wheel event
    if event.num == 5 or event.delta == -120:
        print("+", event.delta)
    if event.num == 4 or event.delta == 120:
        print("-", event.delta)

root.bind("<Button-4>", mouse_wheel)
root.bind("<Button-5>", mouse_wheel)

def add(n, Title, Artist, Album, Cover, Year):
    a = Label(window, text = "Title").grid(row = 0+n,column = 0)
    b = Label(window, text = "Artist").grid(row = 1+n,column = 0)
    c = Label(window, text = "Album").grid(row = 2+n,column = 0)
    d = Label(window, text = "Cover").grid(row = 3+n,column = 0)
    e = Label(window, text = "Year").grid(row = 4+n,column = 0)

    sa= StringVar()
    a1 = Entry(window,textvariable=sa).grid(row = 0+n,column = 1)
    sa.set(Title)

    sb= StringVar()
    b1 = Entry(window,textvariable=sb).grid(row = 1+n,column = 1)
    sb.set(Artist)

    sc= StringVar()
    c1 = Entry(window,textvariable=sc).grid(row = 2+n,column = 1)
    sc.set(Album)

    sd= StringVar()
    d1 = Entry(window,textvariable=sd).grid(row = 3+n,column = 1)
    sd.set(Cover)

    se= StringVar()
    e1 = Entry(window,textvariable=se).grid(row = 4+n,column = 1)
    se.set(Year)

    d2= ttk.Button(window, text="browse").grid(row=3+n,column=2)
    
    f= ttk.Button(window, text="save").grid(row=5+n,column=0)
    
    spacer = Label(window, text="").grid(row=6+n, column=0)

    return #{"Title":}






ls = list()
i = 0
for f in flist:
    add(i, "a", "b", "c", "d", "e")
    i += 7



def save():
    print("ciao")
    
#btn = ttk.Button(window ,text="Submit",command=clicked).grid(row=4,column=0)
window.mainloop()
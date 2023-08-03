# script python per far finta di seguire il corso sulla sicurezza
# 
# 
# una volta avviato questo script, aspetta 20 secondi, poi aspetta che il mouse rimanga fermo per più di altri 40 secondi, dopodichè cliccherà in quel punto ogni 40 secondi
# 
# wine ~/.wine/drive_c/Python27/Scripts/pyinstaller.exe --onefile "/home/tubbadu/Scrivania/nana.py"

import pyautogui
from time import sleep
print("waiting 20 seconds...")
sleep(20)
print("starting...")
while(True):
	xy = pyautogui.position()
	moved = False
	for i in range(4):
		sleep (10)
		nowxy = pyautogui.position()
		print(xy, nowxy)
		if(xy != nowxy):
			print("è stato mosso il mouse")
			moved = True
			xy = nowxy
			break
	# sono passati 40 secondi, ora vediamo se il mouse si è mosso
	if(not moved):
		print("clicco!")
		pyautogui.click()

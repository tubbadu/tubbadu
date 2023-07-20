#!/usr/bin/python3

#youtube-dl_GUI.py
import os
from time import sleep
import pyautogui

trepallini = (1520, 237)
rimuovidaplaylist = (1632, 409)
DeltaT = 0.04

def deleteYoutubePlaylistVideos_openMenu():
    pyautogui.click(trepallini)

def deleteYoutubePlaylistVideos_deleteVideo():
    pyautogui.click(rimuovidaplaylist)
    
print('assicurarsi di avere la pagina di Opera aperta a schermo intero nel monitor del pc')
n = input('inserire numero di video da eliminare (nota: i video verranno eliminati a partire dall\'alto)\n>>')
sleep(1)
if n.isnumeric():
    n = int(n)
    for i in range(n):
        deleteYoutubePlaylistVideos_openMenu()
        sleep(DeltaT)
        deleteYoutubePlaylistVideos_deleteVideo()
        sleep(DeltaT)
    print('voila Hai appena eliminato', n, 'canzoni dalla tua playlist')
else:
    print('fottiti non si puo fare')

input()

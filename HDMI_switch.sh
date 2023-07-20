#!/bin/bash
# use any flag to suppress the monitor configuration, in order to only get the icon

monitorName=HDMI-1 #per vedere la lista di tutti i monitor collegati e scegliere quale controllare con questo script, lanciare in un terminale: xrandr --listmonitors
if [ $# == 0 ]; then
	if (xrandr --listactivemonitors | grep "$monitorName"); then # se il monitor è attivo:
		xrandr --auto && xrandr --output $monitorName --off # disattiva il monitor
	else # se il monitor è disattivo:
		xrandr --output $monitorName --auto --right-of eDP-1 # attivo il monitor e lo dispongo a destra dell'altro monitor eDP-1, per altre disposizioni digitare xrandr --help 
	fi
fi


if (xrandr | grep "$monitorName connected 1920"); then
	echo '{PlasmoidIconStart}/home/tubbadu/Immagini/Wallpapers/HDMI_on.png{PlasmoidIconEnd}'
else
	echo '{PlasmoidIconStart}/home/tubbadu/Immagini/Wallpapers/HDMI_off.png{PlasmoidIconEnd}'
fi

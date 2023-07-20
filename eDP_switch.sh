#!/bin/bash

monitorName=eDP-1
echo "Sei sicuro di voler modificare il monitor del Portatile? premere invio per confermare"
read bin
if (xrandr | grep "$monitorName connected primary 1920"); then
    xrandr --auto && xrandr --output $monitorName --off
else
    xrandr --output eDP-1 --auto --left-of HDMI-1
fi

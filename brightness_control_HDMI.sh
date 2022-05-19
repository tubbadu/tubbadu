#!/bin/bash
 echo "a quanto vuoi impostare la luminosità?"
 read lum 
 xrandr --output HDMI-1 --brightness $lum

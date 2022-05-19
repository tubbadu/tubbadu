#!/usr/bin/bash
echo "running: superupdate"
#echo "run \"plasma-discover-update\" to reset counter"
sudo dnf upgrade -y && sudo flatpak update -y && echo "Packages updated successfully (I hope)" && dunstify -a superupdate -i system-upgrade "packages updated successfully" && plasma-discover-update ; exit
echo -e "\nsomething went wrong :/" && dunstify -a superupdate -i system-upgrade "Something went wrong :/"


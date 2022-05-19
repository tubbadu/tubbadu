#!/usr/bin/bash

dunstify "change row 22 and set it to PlasmaCore.Types.NoBackground" -t 0
kate /usr/share/plasma/plasmoids/org.kde.plasma.systemmonitor/contents/ui/main.qml

dunstify 'add row 36  under matchistouchpad on the following: Option "Tapping" "True" (has been copyed into your clipboard)' -t 0
echo 'Option "Tapping" "True"' | xclip -sel clip
kate /usr/share/X11/xorg.conf.d/40-libinput.conf

dunstify 'change knotes icon: run this command\n sudo rm /usr/share/icons/breeze/apps/48/knotes.svg && sudo cp /home/tubbadu/Immagini/Wallpapers/knotes.svg /usr/share/icons/breeze/apps/48/knotes.svg \n has been copyed to clipboard' -t 0
echo 'sudo rm /usr/share/icons/breeze/apps/48/knotes.svg && sudo cp /home/tubbadu/Immagini/Wallpapers/knotes.svg /usr/share/icons/breeze/apps/48/knotes.svg && sudo rm /usr/share/icons/breeze-dark/apps/48/knotes.svg && sudo cp /home/tubbadu/Immagini/Wallpapers/knotes.svg /usr/share/icons/breeze-dark/apps/48/knotes.svg' | xclip -sel clip
konsole

dunstify 'fix personal keyboard layout: paste the command copied in clipboard' -t 0
echo "sudo rm /home/tubbadu/code/altro/KeyboardMapping/symbols/it && sudo cp /home/tubbadu/code/altro/KeyboardMapping/it /home/tubbadu/code/altro/KeyboardMapping/symbols/it" | xclip -sel clip
konsole

dunstify 'relaunching now plasmashell in order to activate those changings (for the keyboard you have to change layout in system settings)'
plasma-restart

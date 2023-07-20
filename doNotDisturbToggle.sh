#!/usr/bin/bash

dnd=$(pgrep doNotDisturb.py)
echo "ciau"
if [[ $1 != "-v" && $1 != "--verbose" ]];
then
    if [[ $dnd ]];
    then
        kill $dnd
    else
        python3 /home/tubbadu/code/utility_script/doNotDisturb.py &
    fi
else
    if [[ $dnd ]];
    then
        echo "{PlasmoidIconStart}notifications-disabled{PlasmoidIconEnd}"
    else
        echo "{PlasmoidIconStart}notifications{PlasmoidIconEnd}"
    fi
fi

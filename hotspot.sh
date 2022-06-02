#!/usr/bin/bash 

hsp="/home/tubbadu/code/GitHub/tubbadu/hotspot.sh" #applets weren't able to use .bin scripts.. dunno why but anyway :)

if [ -z "$1" ]; then
	echo "usage:"
	echo "   hotspot on:                      turn on \"tubbadu-hotspot-crypted\" hotspot connection"
	echo "   hotspot off:                     turn off \"tubbadu-hotspot-crypted\" hotspot connection"
	echo "   hotspot toggle:                  toggle \"tubbadu-hotspot-crypted\" hotspot connection"
	echo "   hotspot scriptinator-toggle:     toggle \"tubbadu-hotspot-crypted\" hotspot connection and changes plasmoid icon"
	echo "   hotspot scriptinator-get-status  check for \"tubbadu-hotspot-crypted\" hotspot connection and changes plasmoid icon"
	echo "   hotspot --help:                  show this list"
else
	if [[ $1 == 'on' ]]; then
		nmcli connection up tubbadu-hotspot-crypted
	elif [[ $1 == 'off' ]]; then
		nmcli connection down tubbadu-hotspot-crypted
	elif [[ $1 == 'toggle' ]]; then
		if [[ $(nmcli -t -f NAME connection show --active) == *"tubbadu-hotspot-crypted"* ]]; then
			hotspot off
		else
			hotspot on
		fi
	elif [[ $1 == 'scriptinator-toggle' ]]; then
		if [[ $(nmcli -t -f NAME connection show --active) == *"tubbadu-hotspot-crypted"* ]]; then
			$hsp off #>/dev/null
			echo 'turning off: {PlasmoidIconStart}/home/tubbadu/Immagini/Wallpapers/hotspot_off.svg{PlasmoidIconEnd}'
		else
			$hsp on #>/dev/null
			echo 'turning on: {PlasmoidIconStart}/home/tubbadu/Immagini/Wallpapers/hotspot_on.svg{PlasmoidIconEnd}'
		fi
	elif [[ $1 == "scriptinator-get-status" ]]; then
		echo "diocane"
		if [[ $(nmcli -t -f NAME connection show --active) == *"tubbadu-hotspot-crypted"* ]]; then
			echo '{PlasmoidIconStart}/home/tubbadu/Immagini/Wallpapers/hotspot_on.svg{PlasmoidIconEnd}'
		else
			echo '{PlasmoidIconStart}/home/tubbadu/Immagini/Wallpapers/hotspot_off.svg{PlasmoidIconEnd}'
		fi
	elif [[ $1 == '-h' || $1 == '--help' ]]; then
		echo "usage:"
		echo "   hotspot on:                      turn on \"tubbadu-hotspot-crypted\" hotspot connection"
		echo "   hotspot off:                     turn off \"tubbadu-hotspot-crypted\" hotspot connection"
		echo "   hotspot toggle:                  toggle \"tubbadu-hotspot-crypted\" hotspot connection"
		echo "   hotspot scriptinator-toggle:     toggle \"tubbadu-hotspot-crypted\" hotspot connection and changes plasmoid icon"
		echo "   hotspot scriptinator-get-status  check for \"tubbadu-hotspot-crypted\" hotspot connection and changes plasmoid icon"
		echo "   hotspot --help:                  show this list"
	else
		echo "Invalid syntax. Type 'hotspot --help' for usage informations."
	fi
fi

if [[ $1 == "scriptinator-get-status" ]]; then
echo "uguali"
else
echo "diversi"
fi


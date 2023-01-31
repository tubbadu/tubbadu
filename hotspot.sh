#!/usr/bin/bash 
#hsp="/home/tubbadu/code/GitHub/tubbadu/hotspot.sh" #applets weren't able to use .bin scripts.. dunno why but anyway :)

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
			$0 off #>/dev/null
			echo 'turning off: {PlasmoidIconStart}network-wireless-hotspot-off{PlasmoidIconEnd}'
		else
			$0 on #>/dev/null
			echo 'turning on: {PlasmoidIconStart}network-wireless-hotspot{PlasmoidIconEnd}'
		fi
	elif [[ $1 == "scriptinator-get-status" ]]; then
		if [[ $(nmcli -t -f NAME connection show --active) == *"tubbadu-hotspot-crypted"* ]]; then
			echo '{PlasmoidIconStart}network-wireless-hotspot{PlasmoidIconEnd}'
		else
			echo '{PlasmoidIconStart}network-wireless-hotspot-off{PlasmoidIconEnd}'
		fi
	elif [[ $1 == "status" ]]; then
		if [[ $(nmcli -t -f NAME connection show --active) == *"tubbadu-hotspot-crypted"* ]]; then
			echo 'hotspot: on'
		else
			echo 'hotspot: off'
		fi
	elif [[ $1 == "auto" ]]; then
		echo "auto hotspot"
		ETH_STATUS=$(ethtool enp1s0 | grep "Link detected:" | awk '{print $3}')
		echo $ETH_STATUS
		if [[ $ETH_STATUS == "no" ]]; then
			echo "Ethernet cable not connected: turning off hotspot"
			$0 off
		elif [[ $ETH_STATUS == "yes" ]]; then
			echo "Ethernet cable connected: turning on hotspot"
			dunstify -a "hotspot" "Ethernet cable connected: automatically turning on hotspot"
			$0 on
		else
			echo "not understood, sorry"
		fi
	elif [[ $1 == '-h' || $1 == '--help' ]]; then
		echo "usage:"
		echo "   hotspot on:                      turn on \"tubbadu-hotspot-crypted\" hotspot connection"
		echo "   hotspot off:                     turn off \"tubbadu-hotspot-crypted\" hotspot connection"
		echo "   hotspot toggle:                  toggle \"tubbadu-hotspot-crypted\" hotspot connection"
		echo "   hotspot scriptinator-toggle:     toggle \"tubbadu-hotspot-crypted\" hotspot connection and changes plasmoid icon"
		echo "   hotspot scriptinator-get-status: check for \"tubbadu-hotspot-crypted\" hotspot connection and changes plasmoid icon"
		echo "   hotspot status:				  check for \"tubbadu-hotspot-crypted\" hotspot connection and changes plasmoid icon"
		echo "   hotspot --help:                  show this list"
	else
		echo "Invalid syntax. Type 'hotspot --help' for usage informations."
	fi
fi

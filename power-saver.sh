currentProfile=$(qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/PowerProfile org.kde.Solid.PowerManagement.Actions.PowerProfile.currentProfile)

if [[ $1 == "scriptinator-status" ]]
then
	if [[ $currentProfile == "power-saver" ]]
	then
		echo '{PlasmoidIconStart}power-saving-on{PlasmoidIconEnd}'
	else
		echo '{PlasmoidIconStart}power-saving-off{PlasmoidIconEnd}'
	fi
	exit
fi

if [[ $currentProfile == "power-saver" ]]
then
	echo "current profile: power-saver"
	echo "setting profile: performance"
	qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/PowerProfile org.kde.Solid.PowerManagement.Actions.PowerProfile.setProfile performance
	qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/KeyboardBrightnessControl org.kde.Solid.PowerManagement.Actions.KeyboardBrightnessControl.setKeyboardBrightness 1
	qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 96000
else
	echo "current profile: $currentProfile"
	echo "setting profile: power-saver"
	qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/PowerProfile org.kde.Solid.PowerManagement.Actions.PowerProfile.setProfile power-saver
	qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/KeyboardBrightnessControl org.kde.Solid.PowerManagement.Actions.KeyboardBrightnessControl.setKeyboardBrightness 0
	qdbus local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl org.kde.Solid.PowerManagement.Actions.BrightnessControl.setBrightness 72000
fi

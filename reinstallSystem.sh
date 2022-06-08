sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf upgrade -y
sudo dnf in -y ffmpeg maim xdotool uget qbittorrent python3-pip filezilla octave xournalpp copyq wine vlc dunst git yakuake kate krename qalculate-gtk gimp inkscape kmail hplip
sudo dnf upgrade -y
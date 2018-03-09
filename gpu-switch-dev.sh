#!/bin/bash
if ! [ -d ~/.cache/MarechalLima/ ]; then ## checks if the directory exist
	mkdir ~/.cache/MarechalLima/ ## if it doesn't exist, here it's created
fi
if ! [ -e /usr/lib/modprobe.d/optimus.conf ]; then ## checks if the file exist
	echo -e 'blacklist nvidia\nblacklist nvidia_drm\nblacklist nvidia_modeset\nblacklist nvidia_uvm' | tee /usr/lib/modprobe.d/optimus.conf ## if it doesn't exist, here it's created
fi
if [[ `lsmod | grep nouveau` == '' ]]; then
	if [[ `cat /usr/lib/modprobe.d/nvidia.conf | grep \#` == '' ]]; then
		mv -f /etc/X11/xorg.conf.d/00-ldm.conf ~/.cache/MarechalLima/00-ldm.conf
		sed -i "s/blacklist/#blacklist/g" /usr/lib/modprobe.d/nvidia.conf
		sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/optimus.conf
		notify-send -i dialog-information "Nouveau, please reboot."
	else
		notify-send -i dialog-information "Already on Nouveau! Please reboot!"
	fi
else
	if ! [[ `cat /usr/lib/modprobe.d/nvidia.conf | grep \#` == '' ]]; then
		mv -f ~/.cache/MarechalLima/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf
		sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/nvidia.conf
		sed -i "s/blacklist/#blacklist/g" /usr/lib/modprobe.d/optimus.conf
		notify-send -i nvidia "Nvidia, please reboot."
	else
		notify-send -i nvidia "Already on Nvidia! Please reboot!"
	fi
fi

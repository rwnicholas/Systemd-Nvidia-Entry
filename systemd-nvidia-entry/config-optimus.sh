#!/bin/bash
if ! [ -d /opt/Systemd-Nvidia-Entry/ ]; then ## checks if the directory exist
	mkdir /opt/Systemd-Nvidia-Entry/ -p ## if it doesn't exist, here it's created
fi
if [[ `lsmod | grep nouveau` == "" ]]; then ## Nvidia
	if ! [[ -e /etc/X11/xorg.conf.d/00-ldm.conf ]]; then
		cp /opt/Systemd-Nvidia-Entry/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf -f
	fi
else
	if [[ -e /etc/X11/xorg.conf.d/00-ldm.conf ]]; then ## Nouveau
		mv /etc/X11/xorg.conf.d/00-ldm.conf /opt/Systemd-Nvidia-Entry/00-ldm.conf -f
	fi
fi
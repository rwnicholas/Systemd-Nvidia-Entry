#!/bin/bash
if ! [ -d /opt/MarechalLima/ ]; then ## checks if the directory exist
	mkdir /opt/MarechalLima/ -p ## if it doesn't exist, here it's created
fi
if [[ `lsmod | grep nouveau` == "" ]]; then ## Nvidia
	if ! [[ -e /etc/X11/xorg.conf.d/00-ldm.conf ]]; then
		mv /opt/MarechalLima/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf -f
	fi
else
	if [[ -e /etc/X11/xorg.conf.d/00-ldm.conf ]]; then ## Nouveau
		mv /etc/X11/xorg.conf.d/00-ldm.conf /opt/MarechalLima/00-ldm.conf -f
	fi
fi
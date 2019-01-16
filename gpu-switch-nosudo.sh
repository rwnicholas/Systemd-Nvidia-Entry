#!/bin/bash
if ! [ -d /home/$1/.cache/MarechalLima/ ]; then ## checks if the directory exist
	mkdir /home/$1/.cache/MarechalLima/ ## if it doesn't exist, here it's created
fi
if ! [ -e /usr/lib/modprobe.d/optimus.conf ]; then ## checks if the file exist
	echo -e 'blacklist nvidia\nblacklist nvidia_drm\nblacklist nvidia_modeset\nblacklist nvidia_uvm' | tee /usr/lib/modprobe.d/optimus.conf ## if it doesn't exist, here it's created
fi
if [[ `lsmod | grep nouveau` == '' ]]; then
	if [[ `cat /usr/lib/modprobe.d/nvidia.conf | grep \#` == '' ]]; then
		mv -f /etc/X11/xorg.conf.d/00-ldm.conf /home/$1/.cache/MarechalLima/00-ldm.conf
		if [[ `cat /usr/lib/modprobe.d/nvidia.conf | grep '#'` == "" ]]; then
            sed -i 's/blacklist/#blacklist/g' /usr/lib/modprobe.d/nvidia.conf
        fi
        if ! [[ `cat /usr/lib/modprobe.d/optimus.conf | grep '#'` == "" ]]; then
            sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/optimus.conf
        fi

		echo "nouveau"
	else
		echo "nouveau!"
	fi
else
	if ! [[ `cat /usr/lib/modprobe.d/nvidia.conf | grep \#` == '' ]]; then
		mv -f /home/$1/.cache/MarechalLima/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf
		if ! [[ `cat /usr/lib/modprobe.d/nvidia.conf | grep '#'` == "" ]]; then
            sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/nvidia.conf
        fi
		sed -i "s/blacklist/#blacklist/g" /usr/lib/modprobe.d/optimus.conf
		echo "nvidia"
	else
		echo "nvidia!"
	fi
fi

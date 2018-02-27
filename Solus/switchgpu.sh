# configFile="Solus"
# configFile=`ls /boot/loader/entries/ | grep $configFile`

if ! [ -d ~/.cache/MarechalLima/ ]; then ## checks if the directory exist
	mkdir ~/.cache/MarechalLima/ ## if it doesn't exist, here it's created
fi
if ! [ -e /usr/lib/modprobe.d/optimus.conf ]; then ## checks if the file exist
	echo 'blacklist nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm' | sudo tee /usr/lib/modprobe.d/optimus.conf ## if it doesn't exist, here it's created
fi

if [[ `lsmod | grep nouveau` == '' ]]; then
	if [[ `sudo cat /usr/lib/modprobe.d/nvidia.conf | grep \#` == '' ]]; then
		#sudo sed -i '/options/s/$/ modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm/' /boot/loader/entries/$configFile
		sudo mv -f /etc/X11/xorg.conf.d/00-ldm.conf ~/.cache/MarechalLima/00-ldm.conf
		sudo sed -i "s/blacklist/#blacklist/g" /usr/lib/modprobe.d/nvidia.conf
		sudo sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/optimus.conf
		echo "Nouveau, reboot"
	else
		echo "Already on Nouveau! Please Reboot"
	fi
else
	if ! [[ `sudo cat /usr/lib/modprobe.d/nvidia.conf | grep \#` == '' ]]; then
		sudo mv -f ~/.cache/MarechalLima/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf
		sudo sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/nvidia.conf
		sudo sed -i "s/blacklist/#blacklist/g" /usr/lib/modprobe.d/optimus.conf
		#sudo sed -i 's/ modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm//g' /boot/loader/entries/$configFile
		echo "Nvidia, reboot"
	else
		echo "Already on Nvidia! Please Reboot"
	fi
fi

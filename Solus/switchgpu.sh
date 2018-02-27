configFile="Solus"
configFile=`ls /boot/loader/entries/ | grep $configFile`
#systemRelease=${systemRelease/.conf/}
if ! [ -d ~/.cache/MarechalLima/ ]; then
	mkdir ~/.cache/MarechalLima/
fi
if [[ `lsmod | grep nouveau` == '' ]]; then
	if [[ `sudo cat /boot/loader/entries/$configFile | grep modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm` == '' ]]; then
		sudo sed -i '/options/s/$/ modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm/' /boot/loader/entries/$configFile
		sudo mv -f /etc/X11/xorg.conf.d/00-ldm.conf ~/.cache/MarechalLima/00-ldm.conf
		sudo sed -i "s/blacklist/#blacklist/g" /usr/lib/modprobe.d/nvidia.conf
		echo "Nouveau"
	else
		echo "Already on Nouveau! Please Reboot"
	fi
else
	if ! [[ `sudo cat /boot/loader/entries/$configFile | grep modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm` == '' ]]; then
		sudo mv -f ~/.cache/MarechalLima/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf
		sudo sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/nvidia.conf
		sudo sed -i 's/ modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm//g' /boot/loader/entries/$configFile
		echo "Nvidia"
	else
		echo "Already on Nvidia! Please Reboot"
	fi
fi

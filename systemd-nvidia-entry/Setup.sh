#!/bin/bash

install(){
	sudo mkdir /opt/Systemd-Nvidia-Entry/ -p
	echo "Making directory /opt/Systemd-Nvidia-Entry"
	sudo cp config-optimus.sh /opt/Systemd-Nvidia-Entry/
	sudo chmod 775 /opt/Systemd-Nvidia-Entry/config-optimus.sh
	sudo cp systemd-nvidia-entry.service /etc/systemd/system/
	sudo systemctl enable systemd-nvidia-entry.service
	sudo cp Systemd-Nvidia-Entry.sh /usr/bin/Systemd-Nvidia-Entry
	sudo chmod +x /usr/bin/Systemd-Nvidia-Entry
	chmod +x Systemd-Nvidia-Entry.sh
	sh Systemd-Nvidia-Entry.sh
	printf "Clr-boot-manager options with Nvidia modules disabled!\n"
	echo " modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm " | sudo tee -a /etc/kernel/cmdline 
}

uninstall(){
	mountPoint="/mnt"
	partitionEFI=$(lsblk -o NAME,FSTYPE -l | grep vfat)
	partitionEFI=${partitionEFI::-5}
	if ! [[ `cat /proc/mounts | grep /boot` == "" ]]; then
		$mountPoint="/boot"
	else
		if ! [[ `cat /proc/mounts | grep /mnt` == "" ]]; then
			printf "\n/mnt is busy! Please unmount /mnt!"
			printf "\nExiting...\n"
			exit    
		fi
		printf "\n----------------------\n\n"
		printf "Mounting EFI Partition ($partitionEFI)\n"
		sudo mount /dev/$partitionEFI $mountPoint
	fi

	sudo rm -f $mountPoint/loader/entries/nvidia.conf
	configFile=$(uname -r)
	if [[ `echo $configFile | grep current` ]]; then
		configFile=${configFile::-8}
	else
		configFile=${configFile::-4}
	fi
	configFile=$(ls $mountPoint/loader/entries/ | grep $configFile)
	sudo sed -i 's/\<modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm\> //g' $mountPoint/loader/entries/$configFile
	if [[ $mountPoint == "/mnt" ]]; then
		sudo umount $mountPoint
	fi

	sudo sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/nvidia.conf

	if ! [[ -e /etc/X11/xorg.conf.d/00-ldm.conf ]]; then
		sudo mv /opt/MarechalLima/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf -f
	fi
	echo "Removing directory /opt/MarechalLima"
	sudo rm -f /usr/bin/Systemd-Nvidia-Entry
	sudo rm -rf /opt/MarechalLima/
	sudo sed -i 's/\<modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm\> //g' /etc/kernel/cmdline
	sudo systemctl disable systemd-nvidia-entry.service
	sudo rm /etc/systemd/system/systemd-nvidia-entry.service
}

if [[ $1 == "rm" ]]; then
	uninstall
else
	install
fi

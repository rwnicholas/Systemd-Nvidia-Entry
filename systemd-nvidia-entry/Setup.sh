#!/bin/bash

install(){
	sudo mkdir /opt/MarechalLima/ -p
	echo "Making directory /opt/MarechalLima"
	sudo cp config-optimus.sh /opt/MarechalLima/
	sudo chmod 775 /opt/MarechalLima/config-optimus.sh
	sudo cp systemd-nvidia-entry.service /etc/systemd/system/
	sudo systemctl enable systemd-nvidia-entry.service
	chmod +x Systemd-Nvidia-Entry.sh
	sh Systemd-Nvidia-Entry.sh
	printf "Clr-boot-manager options with Nvidia modules disabled!\n"
	echo " modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm " | sudo tee -a /etc/kernel/cmdline 
}

uninstall(){
	partitionEFI=$(lsblk -o NAME,FSTYPE -l | grep vfat)
	partitionEFI=${partitionEFI::-5}
	if ! [[ `cat /proc/mounts | grep /mnt` == "" ]]; then
		printf "\n/mnt is busy! Please unmount /mnt!"
		printf "\nExiting...\n"
		exit    
	fi

	printf "\n----------------------\n\n"
	printf "Mounting EFI Partition ($partitionEFI)\n"
	sudo mount /dev/$partitionEFI /mnt

	sudo rm -f /mnt/loader/entries/nvidia.conf
	configFile=$(uname -r)
	if [[ `echo $configFile | grep current` ]]; then
		configFile=${configFile::-8}
	else
		configFile=${configFile::-4}
	fi
	configFile=$(ls /mnt/loader/entries/ | grep $configFile)
	sudo sed -i 's/\<modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm\> //g' /mnt/loader/entries/$configFile

	if ! [[ -e /etc/X11/xorg.conf.d/00-ldm.conf ]]; then
		sudo mv /opt/MarechalLima/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf -f
	fi
	echo "Removing directory /opt/MarechalLima"
	sudo rm -rf /opt/MarechalLima/
	sudo systemctl disable systemd-nvidia-entry.service
	sudo rm /etc/systemd/system/systemd-nvidia-entry.service
	sudo sed -i 's/\<modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm\> //g' /etc/kernel/cmdline
	sudo umount /mnt
}

if [[ $1 == "rm" ]]; then
	uninstall
else
	install
fi
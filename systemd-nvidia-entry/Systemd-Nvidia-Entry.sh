#!/bin/bash
systemRelease=$(lsb_release -is)
printf "######### WARNING ########\n"
printf "You need to be on the latest kernel!\n"
printf "Do you wish to proceed? Clr-boot-manager will RUN (on Solus)!\n"
select yn in "Yes" "No"; do
	case $yn in
		"Yes") if [ $systemRelease == "Solus" ]; then
				sudo clr-boot-manager update
			fi
			break;;
		"No") exit;;
	esac
done

partitionEFI=$(lsblk -o NAME,FSTYPE -l | grep vfat)
partitionEFI=${partitionEFI::5}
if ! [[ `ls /mnt` == "" ]]; then
	printf "\n/mnt is busy! Please unmount /mnt!"
	printf "\nExiting...\n"
	exit    
fi

printf "\n----------------------\n\n"
printf "Mounting EFI Partition ($partitionEFI)\n"
sudo mount /dev/$partitionEFI /mnt

printf "\n----------------------\n\n"
printf "Configuring...\n"
printf "Original boot options with Nvidia modules disabled!\n"
configFile=`ls /mnt/loader/entries/ | grep $systemRelease`

if [[ `sudo cat /mnt/loader/entries/$configFile | grep modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm` == '' ]]; then
	sudo sed -i '/options/s/$/ modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm/' /mnt/loader/entries/$configFile
fi
sudo cp -f /mnt/loader/entries/$configFile /mnt/loader/entries/nvidia.conf
# # Enables nouveau by default
# sudo sed -i 's/\<rd.driver.blacklist=nouveau\> //g' /mnt/loader/entries/$configFile
# sudo sed -i 's/\<modprobe.blacklist=nouveau\> //g' /mnt/loader/entries/$configFile
# sudo sed -i 's/\<nvidia-drm.modeset=1\> //g' /mnt/loader/entries/$configFile
#
sudo sed -i '/title/s/$/ Nvidia/' /mnt/loader/entries/nvidia.conf

if [[ `sudo cat /mnt/loader/entries/nvidia.conf | grep rd.driver.blacklist=nouveau` == '' ]]; then
	sudo sed -i '/options/s/$/ rd.driver.blacklist=nouveau/' /mnt/loader/entries/nvidia.conf
fi
if [[ `sudo cat /mnt/loader/entries/nvidia.conf | grep modprobe.blacklist=nouveau` == '' ]]; then
	sudo sed -i '/options/s/$/ modprobe.blacklist=nouveau/' /mnt/loader/entries/nvidia.conf
fi
if [[ `sudo cat /mnt/loader/entries/nvidia.conf | grep nvidia-drm.modeset=1` == '' ]]; then
	sudo sed -i '/options/s/$/ nvidia-drm.modeset=1/' /mnt/loader/entries/nvidia.conf
fi

sudo sed -i 's/\<modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm\> //g' /mnt/loader/entries/nvidia.conf
printf "\nNew boot menu entry with Nvidia modules enabled\n"

sudo umount /mnt
# https://github.com/MarechalLima/Systemd-Nvidia-Entry
systemRelease="Solus" ###### Edit Here #####
#Curnel=`uname -r`
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

printf "\n----------------------\n\n"
printf "Configuring...\n"
printf "Original boot options with Nvidia modules disabled!\n"
configFile=`ls /boot/loader/entries/ | grep $systemRelease`
echo $configFile
if [[ `sudo cat /boot/loader/entries/$configFile | grep modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm` == '' ]]; then
    sudo sed -i '/options/s/$/ modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm/' /boot/loader/entries/$configFile
fi
sudo cp -f /boot/loader/entries/$configFile /boot/loader/entries/nvidia.conf
# # Enables nouveau by default
# sudo sed -i 's/\<rd.driver.blacklist=nouveau\> //g' /boot/loader/entries/$configFile
# sudo sed -i 's/\<modprobe.blacklist=nouveau\> //g' /boot/loader/entries/$configFile
# sudo sed -i 's/\<nvidia-drm.modeset=1\> //g' /boot/loader/entries/$configFile
#
# sudo cat /boot/loader/entries/$configFile
#
# printf "\nNew boot menu entry with Nvidia modules enabled:\n"
#
# modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm
#
sudo cat /boot/loader/entries/nvidia.conf
sudo sed -i '/title/s/$/ Nvidia/' /boot/loader/entries/nvidia.conf
#sudo sed -i 's/\<modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm\> //g' /boot/loader/entries/nvidia.conf
if [[ `sudo cat /boot/loader/entries/nvidia.conf | grep rd.driver.blacklist=nouveau` == '' ]]; then
    sudo sed -i '/options/s/$/ rd.driver.blacklist=nouveau/' /boot/loader/entries/nvidia.conf
fi
if [[ `sudo cat /boot/loader/entries/nvidia.conf | grep modprobe.blacklist=nouveau` == '' ]]; then
    sudo sed -i '/options/s/$/ modprobe.blacklist=nouveau/' /boot/loader/entries/nvidia.conf
fi
if [[ `sudo cat /boot/loader/entries/nvidia.conf | grep nvidia-drm.modeset=1` == '' ]]; then
    sudo sed -i '/options/s/$/ nvidia-drm.modeset=1/' /boot/loader/entries/nvidia.conf
fi
#if ! [ $(sudo cat /boot/loader/entries/nvidia.conf | grep "modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm") == "" ]; then
sudo sed -i 's/\<modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm\> //g' /boot/loader/entries/nvidia.conf
#fi

sudo cat /boot/loader/entries/nvidia.conf

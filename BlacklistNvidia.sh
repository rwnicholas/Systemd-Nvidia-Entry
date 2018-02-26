# https://github.com/MarechalLima/Systemd-Nvidia-Entry
systemRelease="Solus" ###### Edit Here #####
#Curnel=`uname -r`
printf "######### WARNING ########\n"
printf "You need to be on the latest kernel!\n"
printf "Do you wish to proceed? Clr-boot-manager will RUN (on Solus)!\n"
select yn in "Yes" "No"; do
    case $yn in
        "Yes") if [ $systemRelease == "Solus" ]; then
				#sudo clr-boot-manager update
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
# # Enables nouveau by default
# sudo sed -i 's/\<rd.driver.blacklist=nouveau\> //g' /etc/default/grub
# sudo sed -i 's/\<modprobe.blacklist=nouveau\> //g' /etc/default/grub
# sudo sed -i 's/\<nvidia-drm.modeset=1\> //g' /etc/default/grub
#
# sudo cat /etc/default/grub
#
# printf "\nNew boot menu entry with Nvidia modules enabled:\n"
#
# echo "\
# #!/bin/sh
# exec tail -n +3 \$0
# # This file provides an easy way to add custom menu entries.  Simply type the
# # menu entries you want to add after this comment.  Be careful not to change
# # the 'exec tail' line above.
# `sudo sed -n '/^menuentry/,/}/p;' /boot/efi/EFI/fedora/grub.cfg | sed '/}/q' | sed 's/modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm//'`" | sudo tee /etc/grub.d/40_custom
#
# if [[ `sudo cat /etc/grub.d/40_custom | grep rd.driver.blacklist=nouveau` == '' ]]; then
#     sudo sed -i '/vmlinuz/s/$/ rd.driver.blacklist=nouveau/' /etc/grub.d/40_custom
# fi
# if [[ `sudo cat /etc/grub.d/40_custom | grep modprobe.blacklist=nouveau` == '' ]]; then
#     sudo sed -i '/vmlinuz/s/$/ modprobe.blacklist=nouveau/' /etc/grub.d/40_custom
# fi
# if [[ `sudo cat /etc/grub.d/40_custom | grep nvidia-drm.modeset=1` == '' ]]; then
#     sudo sed -i '/vmlinuz/s/$/ nvidia-drm.modeset=1/' /etc/grub.d/40_custom
# fi
#
# sudo cat /etc/grub.d/40_custom

configFile=`ls /boot/loader/entries/ | grep $systemRelease`
echo $configFile
# if [[ `sudo cat /boot/loader/loader.conf | grep modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm` == '' ]]; then
#     sudo sed -i '/options/s/$/ modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm/' /boot/loader/entries/$configFile
# fi

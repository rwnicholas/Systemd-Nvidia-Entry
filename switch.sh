systemRelease="Solus"
systemRelease=`ls /boot/loader/entries/ | grep $systemRelease`
systemRelease=${systemRelease/.conf/}
if ! [ -d ~/.cache/MarechalLima/ ]; then
	mkdir ~/.cache/MarechalLima/
fi
if [[ `sudo cat /boot/loader/loader.conf | grep $systemRelease` == "default $systemRelease" ]]; then
    sudo sed -i "s/$systemRelease/nvidia/g" /boot/loader/loader.conf
	sudo mv -f ~/.cache/MarechalLima/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf
	sudo sed -i "s/#blacklist/blacklist/g" /usr/lib/modprobe.d/nvidia.conf
else
	sudo sed -i "s/nvidia/$systemRelease/g" /boot/loader/loader.conf
	sudo mv -f /etc/X11/xorg.conf.d/00-ldm.conf ~/.cache/MarechalLima/00-ldm.conf
	sudo sed -i "s/blacklist/#blacklist/g" /usr/lib/modprobe.d/nvidia.conf
fi

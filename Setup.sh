#!/bin/bash

if ! [ -d /opt/solus-prime-indicator/ ]; then ## checks if the directory exist
	sudo mkdir /opt/solus-prime-indicator/ -p ## if it doesn't exist, here it's created
fi

install(){
	if [[ `whoami` == "root" ]]; then
		echo "No root!"
		exit 1
	fi

	if ! [[ -d ~/.config/autostart/ ]]; then
		mkdir ~/.config/autostart/
	fi

	sudo cp config-optimus.sh /opt/solus-prime-indicator/
	sudo chmod 775 /opt/solus-prime-indicator/config-optimus.sh
	sudo cp solus-prime-indicator.service /etc/systemd/system/
	sudo systemctl enable solus-prime-indicator.service
	sudo cp gpu-switch-nosudo.sh /usr/bin/gpu-switch
	sudo cp trayicon.py /usr/bin/solus-prime-indicator
	sudo cp /etc/X11/xorg.conf.d/00-ldm.conf /opt/solus-prime-indicator/
	cp solus-prime-indicator.desktop ~/.config/autostart/solus-prime-indicator.desktop
	sudo cp gpu-switch.policy /usr/share/polkit-1/actions/gpu-switch.policy
	sudo chmod +x /usr/bin/gpu-switch
	sudo chmod +x /usr/bin/solus-prime-indicator
}

uninstall(){
	if [[ `whoami` == "root" ]]; then
		echo "No root!"
		exit 1
	fi

	if ! [[ `lsmod | grep nouveau` == '' ]]; then
		echo "Please, switch for Nvidia!"
	else
		sudo rm -rf /opt/solus-prime-indicator/
		sudo systemctl disable solus-prime-indicator.service
		sudo rm /etc/systemd/system/solus-prime-indicator.service
		sudo rm -f /usr/bin/gpu-switch
		sudo rm -f /usr/bin/solus-prime-indicator
		rm -f ~/.config/autostart/solus-prime-indicator.desktop
		sudo rm -f /usr/share/polkit-1/actions/gpu-switch.policy
		sudo rm -f /usr/lib/modprobe.d/optimus.conf
	fi
}

if [[ $1 == "rm" ]]; then
	uninstall
else
	install
fi
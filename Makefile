install:
	sudo cp switchgpu.sh /usr/bin/switchgpu
	sudo chmod +x /usr/bin/switchgpu
uninstall:
	echo "After your system will reboot, please SAVE YOUR WORK before the password!"
	if ! [ `lsmod | grep nouveau` == '' ]; then
		sudo /usr/bin/switchgpu
	fi
	sudo rm -f /usr/bin/switchgpu
	sudo reboot

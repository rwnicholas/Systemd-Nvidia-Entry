install:
	sudo cp switchgpu.sh /usr/bin/switchgpu
	sudo cp /etc/X11/xorg.conf.d/00-ldm.conf ~/.cache/00-ldm.conf.bkp
	sudo chmod +x /usr/bin/switchgpu
uninstall:
	@if ! [[ `lsmod | grep nouveau` == '' ]]; then\
		@echo "Your system is going to reboot, please SAVE YOUR WORK before the password!";\
		sudo /usr/bin/switchgpu;\
		sudo rm -f /usr/bin/switchgpu;\
		sudo reboot;\
	else\
		sudo rm -f /usr/bin/switchgpu;\
	fi\
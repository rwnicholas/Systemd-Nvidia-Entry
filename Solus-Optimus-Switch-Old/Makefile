install:
	sudo cp gpu-switch.sh /usr/bin/gpu-switch
	sudo cp gpu-status.sh /usr/bin/gpu-status
	sudo cp /etc/X11/xorg.conf.d/00-ldm.conf ~/.cache/00-ldm.conf.bkp
	sudo cp gpu-status.desktop /usr/share/xdg/autostart/gpu-status.desktop
	sudo chmod +x /usr/bin/gpu-switch
	sudo chmod +x /usr/bin/gpu-status
	sudo chmod +x /usr/share/xdg/autostart/gpu-status.desktop
uninstall:
	@if ! [[ `lsmod | grep nouveau` == '' ]]; then\
		echo "Your system is going to reboot, please SAVE YOUR WORK before the password!";\
		sh gpu-switch.sh;\
		sudo rm -f /usr/bin/gpu-switch;\
		sudo rm -f /usr/bin/gpu-status;\
		sudo rm -f /usr/share/xdg/autostart/gpu-status.desktop;\
		sudo rm -f /usr/lib/modprobe.d/optimus.conf;\
		sudo reboot;\
	else\
		sudo rm -f /usr/bin/gpu-switch;\
		sudo rm -f /usr/bin/gpu-status;\
		sudo rm -f /usr/share/xdg/autostart/gpu-status.desktop;\
		sudo rm -f /usr/lib/modprobe.d/optimus.conf;\
	fi\

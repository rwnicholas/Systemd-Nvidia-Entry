install:
	sudo cp gpu-switch-nosudo.sh /usr/bin/gpu-switch
	sudo cp trayicon.py /usr/bin/solus-prime-indicator
	sudo cp /etc/X11/xorg.conf.d/00-ldm.conf ~/.cache/00-ldm.conf.bkp
	cp solus-prime-indicator.desktop ~/.config/autostart/solus-prime-indicator.desktop
	sudo cp gpu-switch.policy /usr/share/polkit-1/actions/gpu-switch.policy
	sudo chmod +x /usr/bin/gpu-switch
	sudo chmod +x /usr/bin/solus-prime-indicator
	@#chmod +x ~/.config/autostart/solus-prime-indicator.desktop
uninstall:
	@if ! [[ `lsmod | grep nouveau` == '' ]]; then\
		echo "Please, switch for Nvidia!";\
		# sudo -s sh gpu-switch-nosudo.sh;\
		# sudo rm -f /usr/bin/gpu-switch;\
		# sudo rm -f /usr/bin/solus-prime-indicator;\
		# sudo rm -f /usr/lib/modprobe.d/optimus.conf;\
		# rm -f ~/.config/autostart/solus-prime-indicator.desktop;\
		# sudo rm -f /usr/share/polkit-1/actions/gpu-switch.policy;\
		# sudo reboot;\
	else\
		sudo rm -f /usr/bin/gpu-switch;\
		sudo rm -f /usr/bin/solus-prime-indicator;\
		sudo rm -f /usr/lib/modprobe.d/optimus.conf;\
		rm -f ~/.config/autostart/solus-prime-indicator.desktop;\
		sudo rm -f /usr/share/polkit-1/actions/gpu-switch.policy;\
	fi\

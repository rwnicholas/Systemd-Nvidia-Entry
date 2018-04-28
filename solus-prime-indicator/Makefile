SHELL := /bin/bash # Use bash syntax

install:
	@if [[ `whoami` == "root" ]]; then \
		echo "No root!";\
		exit 1;\
	fi; \

	@if ! [[ -d ~/.config/autostart/ ]]; then \
		mkdir ~/.config/autostart/ ;\
	fi; \

	sudo cp gpu-switch-nosudo.sh /usr/bin/gpu-switch
	sudo cp trayicon.py /usr/bin/solus-prime-indicator
	sudo cp solus-prime-indicator.desktop /usr/share/applications/solus-prime-indicator.desktop
	cp solus-prime-indicator.desktop ~/.config/autostart/solus-prime-indicator.desktop
	sudo cp gpu-switch.policy /usr/share/polkit-1/actions/gpu-switch.policy
	sudo chmod +x /usr/bin/gpu-switch
	sudo chmod +x /usr/bin/solus-prime-indicator
	sudo cp /etc/X11/xorg.conf.d/00-ldm.conf ~/.cache/00-ldm.conf.bkp

uninstall:
	@if [[ `whoami` == "root" ]]; then \
		echo "No root!";\
		exit 1;\
	fi; \

	@if ! [[ `lsmod | grep nouveau` == '' ]]; then \
		echo "Please, switch for Nvidia!";\
	else \
		sudo rm -f /usr/bin/gpu-switch;\
		sudo rm -f /usr/bin/solus-prime-indicator;\
		rm -f ~/.config/autostart/solus-prime-indicator.desktop;\
		sudo rm -f /usr/share/polkit-1/actions/gpu-switch.policy;\
		sudo rm -f /usr/lib/modprobe.d/optimus.conf;\
	fi; \

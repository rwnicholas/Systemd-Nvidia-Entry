SHELL := /bin/bash # Use bash syntax

install:
	@if [[ `whoami` == "root" ]]; then \
		echo "No root!";\
		exit 1;\
	fi; \

	@if ! [[ -d ~/.config/autostart/ ]]; then \
		mkdir ~/.config/autostart/ ;\
	fi; \

	sudo cp trayicon.py /usr/bin/solus-prime-indicator
	cp solus-prime-indicator.desktop ~/.config/autostart/solus-prime-indicator.desktop
	sudo chmod +x /usr/bin/solus-prime-indicator

uninstall:
	@if [[ `whoami` == "root" ]]; then \
		echo "No root!";\
		exit 1;\
	fi; \

	sudo rm -f /usr/bin/solus-prime-indicator
	rm -f ~/.config/autostart/solus-prime-indicator.desktop

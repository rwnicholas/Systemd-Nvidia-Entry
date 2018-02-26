install:
	sudo cp BlacklistNvidia.sh /usr/bin/blacklist-nvidia
	sudo chmod +x /usr/bin/blacklist-nvidia
	sudo cp switchgpu.sh /usr/bin/switchgpu
	sudo chmod +x /usr/bin/switchgpu

uninstall:
	sudo rm -f /usr/bin/blacklist-nvidia
	sudo /usr/bin/switchgpu
	sudo rm -f /usr/bin/switchgpu
	sudo rm -f /boot/loader/entries/nvidia.conf

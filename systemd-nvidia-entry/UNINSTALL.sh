#!/bin/bash
if ! [[ -e /etc/X11/xorg.conf.d/00-ldm.conf ]]; then
	mv /opt/MarechalLima/00-ldm.conf /etc/X11/xorg.conf.d/00-ldm.conf -f
fi
echo "Removing directory /opt/MarechalLima"
sudo rm -rf /opt/MarechalLima/
sudo systemctl disable systemd-nvidia-entry.service
sudo rm /etc/systemd/system/systemd-nvidia-entry.service
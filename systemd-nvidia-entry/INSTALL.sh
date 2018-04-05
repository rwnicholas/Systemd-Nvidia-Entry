#!/bin/bash
sudo mkdir /opt/MarechalLima/ -p
echo "Making directory /opt/MarechalLima"
sudo cp config-optimus.sh /opt/MarechalLima/
sudo chmod 775 /opt/MarechalLima/config-optimus.sh
sudo cp systemd-nvidia-entry.service /etc/systemd/system/
sudo systemctl enable systemd-nvidia-entry.service
chmod +x Systemd-Nvidia-Entry.sh
sh Systemd-Nvidia-Entry.sh
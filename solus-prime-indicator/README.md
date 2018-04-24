# Solus-Prime-Indicator
* It's started as a fork from [Grub-Nvidia-Entry](https://github.com/Superdanby/Grub-Nvidia-Entry)
* **[Download here for Solus](https://github.com/MarechalLima/Systemd-Nvidia-Entry/releases/tag/v1-1)**

## Prerequisites
*	Nvidia driver
*	make
*	python3-qt5

## Supported Operating Systems
*   Solus

## Instructions
*   After installing Nvidia drivers, and rebooting...
*	Install with "make install".

## Caution
### DO NOT UPGRADE NVIDIA PACKAGE USING NOUVEAU
* If you did: Ctrl + Alt + F2; After logging, type: sudo mv -f /etc/X11/xorg.conf.d/00-ldm.conf ~/.cache/MarechalLima/00-ldm.conf
#### If you are updating your script, you should run 'make uninstall' before installing
* /etc/X11/xorg.conf.d/00-ldm.conf is moved to ~/.cache/MarechalLima while using nouveau. MAKE A COPY FOR BACKUP! (the Makefile will create a copy at ~/.cache/00-ldm.conf.bkp)
* /usr/lib/modprobe.d/nvidia.conf has 'blacklist' commented while using nouveau.

## Donation
[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=nicholaslima%2erw%40gmail%2ecom&lc=US&item_name=Nicholas%20Lima%20de%20Souza%20Silva&item_number=MarechalLima&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted)

# Disclaimer
* **USE AT YOUR OWN RISK**

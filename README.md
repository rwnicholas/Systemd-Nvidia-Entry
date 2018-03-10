# Solus-Optimus-Switch
* It's started as a fork from [Grub-Nvidia-Entry](https://github.com/Superdanby/Grub-Nvidia-Entry)
* I'm trying this using Solus, but I believe that others systems can work with some tweaks.
* **[Download here for Solus](https://www.dropbox.com/s/0ztla0bei6au6q2/SolusOptimusSwitch.zip?dl=0) the script gpu-switch.sh and the Makefile for Solus**

## Prerequisites
*   Nvidia driver
#### For solus-prime-indicator
*	python3-qt5
*  	gpu-switch-nosudo

## Supported Operating Systems
*   Solus

## Instructions
*   After installing Nvidia drivers, and rebooting...
*	Use switchgpu.sh to switch between nouveau(battery economy) and nvidia(performance)
*	You can also install with "make install" and use switchgpu from any place on terminal.

## Caution
#### If you are updating your script, you should run 'make uninstall' before installing
* /etc/X11/xorg.conf.d/00-ldm.conf is moved to ~/.cache/MarechalLima while using nouveau. MAKE A COPY FOR BACKUP! (the Makefile will create a copy at ~/.cache/00-ldm.conf.bkp)
* /usr/lib/modprobe.d/nvidia.conf has 'blacklist' commented while using nouveau.

## Donation
[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=nicholaslima%2erw%40gmail%2ecom&lc=US&item_name=Nicholas%20Lima%20de%20Souza%20Silva&item_number=MarechalLima&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted)

# Disclaimer
* **USE AT YOUR OWN RISK**

# Systemd-Nvidia-Entry
### Hey, please, before anything make sure that your EFI partition is mounting on /boot 
* Hi, the idea from switching on boot is from [Grub-Nvidia-Entry](https://github.com/Superdanby/Grub-Nvidia-Entry). This is a fork to implement this method on systemd.
* I'm trying this using Solus OS, but I believe that others systems can work with some tweaks.
* [Download here](https://www.dropbox.com/s/ijrozhageftvy1p/OptimusScript.zip?dl=0) the script switchgpu.sh and the Makefile
## Prerequisites
*   UEFI
*   Nvidia driver

## Supported Operating Systems
*   Solus OS

## Instructions
*   After installing Nvidia drivers, and rebooting...
*	Use switchgpu.sh to switch between nouveau(battery economy) and nvidia(performance)
*	You can also install with "make install" and use switchgpu from any place on terminal.

## Caution
* /etc/X11/xorg.conf.d/00-ldm.conf is moved to ~/.cache/MarechalLima while using nouveau. MAKE A COPY FOR BACKUP!
* /usr/lib/modprobe.d/nvidia.conf has 'blacklist' commented while using nouveau.

## Issues

# Systemd-Nvidia-Entry
### Hey, if your EFI partition is not mounted at /boot, use the files that is inside the folder **Solus**
* Hi, the idea from switching on boot is from [Grub-Nvidia-Entry](https://github.com/Superdanby/Grub-Nvidia-Entry). This is a fork to implement this method on systemd.
* I'm trying this using Solus, but I believe that others systems can work with some tweaks.
* **[Download here for Solus](https://www.dropbox.com/s/0ztla0bei6au6q2/SolusOptimusScript.zip?dl=0) the script switchgpu.sh and the Makefile for Solus**

## Prerequisites
*   UEFI
*   Nvidia driver

## Supported Operating Systems
*   Solus

## Instructions
*   After installing Nvidia drivers, and rebooting...
*	Use switchgpu.sh to switch between nouveau(battery economy) and nvidia(performance)
*	You can also install with "make install" and use switchgpu from any place on terminal.

## Caution
* /etc/X11/xorg.conf.d/00-ldm.conf is moved to ~/.cache/MarechalLima while using nouveau. MAKE A COPY FOR BACKUP! (the Makefile will create a copy at ~/.cache/00-ldm.conf.bkp)
* /usr/lib/modprobe.d/nvidia.conf has 'blacklist' commented while using nouveau.

## Issues

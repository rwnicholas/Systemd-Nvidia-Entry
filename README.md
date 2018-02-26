# Systemd-Nvidia-Entry
* Hi, the idea from switching on boot is from [Grub-Nvidia-Entry](https://github.com/Superdanby/Grub-Nvidia-Entry). This is a fork to implement this method on systemd.
* I'm trying this using Solus OS, but I believe that others systems can work with some tweaks.
## Prerequisites
*   UEFI
*   Nvidia driver

## Supported Operating Systems
*   Solus OS

## Instructions
*   After installing Nvidia drivers, run BlacklistNvidia.sh.
*   Rerun the script(s) after a kernel update will make the created entry use the new kernel.
*	To switch from nvidia to nouveau you should run the script switchgpu.sh and reboot.

## Caution
* /etc/X11/xorg.conf.d/00-ldm.conf is moved to ~/.cache/MarechalLima while using nouveau.
* /usr/lib/modprobe.d/nvidia.conf has 'blacklist' commented while using nouveau.

## Issues


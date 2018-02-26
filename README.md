# Systemd-Nvidia-Entry
* Hi, the idea from switching on boot is from [Grub-Nvidia-Entry](https://github.com/Superdanby/Grub-Nvidia-Entry). This is a fork to implement this method on systemd.
* I'm trying this using Solus OS, but I believe that others system will work properly.
## Prerequisites
*   UEFI
*   Nvidia driver

## Supported Operating Systems
*   Solus OS

## Instructions
*   After installing Nvidia drivers, run BlacklistNvidia.sh.
*   <s>If you'd like to use the drivers with Secure Boot on, run SignNvidia.sh.</s>
*   Rerun the script(s) after a kernel update will make the created entry use the new kernel.

## Caution
* /etc/X11/xorg.conf.d/00-ldm.conf and /usr/lib/modprobe.d/nvidia.conf are moved.

## Issues


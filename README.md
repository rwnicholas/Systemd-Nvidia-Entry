# Systemd-Nvidia-Entry
* It's started as a fork from [Grub-Nvidia-Entry](https://github.com/Superdanby/Grub-Nvidia-Entry)
* I'm trying this using Solus, but I believe that others systems can work with some tweaks.
* There are two versions, one with Nouveau and this one with bbswitch, if you prefer with nouveau go to Releases.

## Prerequisites
*	Nvidia driver
*	UEFI
*	bbswitch-current

## Supported Operating Systems
*	Solus (tested on current kernel)
*	Arch Linux
		`sudo pacman -S lsb-release`

## Arch
*	After installing Nvidia driver and lsb-release
*	Run Systemd-Nvidia-Entry.sh
*	On Arch there is no need to run it again after updates.

## Solus Instructions 

* Install bbswitch-current:

	`sudo eopkg install bbswitch-current`
	
* Install nvidia proprietary drivers:

	`sudo eopkg install nvidia-glx-driver-current nvidia-glx-driver-common nvidia-glx-driver-32bit`

* Reboot your computer

* Clone scripts:

	`git clone git@github.com:MarechalLima/Systemd-Nvidia-Entry.git`

* Execute the following command to make Intel as default:

	`sh Setup.sh`
* To get rid of everything and make Nvidia default again:
	
	`sh Setup.sh rm`

### Solus-prime-indicator (it only shows which driver is up)
* To install solus-prime-indicator use the command:

	`python3 extra.py install`

* You can remove solus-prime-indicator with the following command:

	`python3 extra.py remove`

## ATTENTION
* After a **kernel update**, you need to execute again:
	
	`Systemd-Nvidia-Entry`

## Caution
When booting, config-optimus.sh will verify whether you are using intel or nvidia, and while on intel 00-ldm.conf will be on /opt/Systemd-Nvidia-Entry/
## Donation
[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=nicholaslima%2erw%40gmail%2ecom&lc=US&item_name=Nicholas%20Lima%20de%20Souza%20Silva&item_number=MarechalLima&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted)

# Disclaimer
* **USE AT YOUR OWN RISK**

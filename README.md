# Systemd-Nvidia-Entry
* It's started as a fork from [Grub-Nvidia-Entry](https://github.com/Superdanby/Grub-Nvidia-Entry)
* I'm trying this using Solus, but I believe that others systems can work with some tweaks.

## Prerequisites
*	Nvidia driver
*	UEFI
*	bbswitch-current

## Supported Operating Systems
*   Solus (tested on current kernel)
*	Maybe on Arch (but no need to execute Setup.sh, just Systemd-Nvidia-Entry.sh)

## Instructions
*   After installing Nvidia drivers, and rebooting...
*	Use Setup.sh to install the files
*	You can use Setup.sh rm to remove the stuff

## Solus Instructions 
* Install bbswitch-current

	`sudo eopkg install bbswitch-current`
	
* Install nvidia proprietary drivers

	`sudo eopkg install nvidia-glx-driver-current`

* Reboot your computer

* Clone scripts

	`git clone git@github.com:MarechalLima/Systemd-Nvidia-Entry.git`

* Execute the following command to switch to intel 

	`python3 install.py switch intel`

* Execute the following command to switch to Nvidia

	`python3 install.py switch nvidia`

* To install solus-prime-indicator use the command 

	`python3 install.py install`

* To remove solus-prime-indicator,  you must first switch to nvidia and then reboot. 

* You can remove with the following command 

	`python3 install.py remove`


## Caution
When booting, config-optimus.sh will verify whether you are using intel or nvidia, and while on intel 00-ldm.conf will be on /opt/Systemd-Nvidia-Entry/
## Donation
[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=nicholaslima%2erw%40gmail%2ecom&lc=US&item_name=Nicholas%20Lima%20de%20Souza%20Silva&item_number=MarechalLima&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted)

# Disclaimer
* **USE AT YOUR OWN RISK**

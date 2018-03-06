if [[ `lsmod | grep nouveau` == "" ]]; then
	notify-send -i nvidia "Nvidia"
else
	notify-send -i dialog-information "Nouveau"
fi

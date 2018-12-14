#!/bin/bash


if [ -z "$1" ]
  then
    echo "Expects three arguments: device_name, idVendor, idProduct  -- See README for more info."
    exit 1
fi
file="/etc/udev/rules.d/99-$1.rules"
touch $file
echo "# rpi-midi-hub rule for $1" > $file
echo 'ATTRS{idVendor}=="$2", ATTRS{idProduct}=="$3"' >> $file
echo 'RUN+="/home/pi/bin/connectall.sh"' >> $file
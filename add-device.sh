#!/bin/bash


if [ -z "$1" ]
  then
    echo "Expects three arguments: device_name, idVendor, idProduct  -- See README for more info."
    exit 1
fi
file="/etc/udev/rules.d/89-$1.rules"
touch $file
echo "ATTRS{idVendor}==\"$2\", ATTRS{idProduct}==\"$3\", RUN+=\"/etc/rpi-midi-hub/midiconnect.sh\"" > $file

udevadm control --reload-rules
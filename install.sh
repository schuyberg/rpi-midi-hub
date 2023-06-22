#!/bin/bash
#
# use this script to quickly set up the rpi-midi-hub

echo "creating directory in /etc/, moving midiconnect scripts there, setting permissions..."
mkdir /etc/rpi-midi-hub
mv ./midiconnect.sh /etc/rpi-midi-hub/
mv ./midiconnect.py /etc/rpi-midi-hub/
#chown -R root:root /etc/rpi/midi-hub has / instead of -
chown -R root:root /etc/rpi-midi-hub

echo "create udev rule to run script on USB add/remove"
file="/etc/udev/rules.d/89-rpi-midi-hub.rules"
touch $file
echo "ACTION=\"add|remove\", SUBSYSTEM==\"usb\", DRIVER==\"usb\", RUN+=\"/etc/rpi-midi-hub/midiconnect.sh\"" > $file
udevadm control --reload-rules

echo "running midiconnect!"
/etc/rpi-midi-hub/midiconnect.sh

echo "setup complete. if you want to run the script at power-on see README.md"
echo "happy jamming!"

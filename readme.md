
### Raspberry Pi USB MIDI Hub

Set up a Raspberry Pi as a USB/MIDI host and auto-connect devices ("brute force" approach: all devices will be connected to all other devices). Adapted from Johannes Ervik's excellent guide found here: http://m635j520.blogspot.com/2017/01/using-raspberry-pi-as-midi-usb5-pin.html


Instructions:

1. Clone this repository to your Raspberry Pi (home directory or wherever): `git clone https://github.com/schuyberg/rpi-midi-hub.git`.

2. Move the `rpi-midi-hub` directory to `/etc/rpi-midi-hub` with `sudo mv ./rpi-midi-hub /etc/`  (make sure it is owned by root: `sudo chown -R root:root /etc/rpi-midi-hub`)

3. Set to run at startup with crontab:
    
    1. Open root crontab `sudo crontab -e`
    2. Add `@reboot /etc/rpi-midi-hub/midiconnect.sh` to auto-connect devices on boot.

4. Set up automatic device detection:
    
    1. Connect your MIDI USB Devices.
    2. Run `lsusb` to get a list of USB devices.
    3. Look for the `idVendor:idProduct` IDs of the devices you want to auto-connect. For example: `ID 0a4d:129d` 
    4. Run the add device script for each device you want to auto-connect with 'device_name', 'idVendor', and 'idProduct' as arguments: `sudo /etc/rpi-midi-hub/add-device mpk-mini 0a4d 129d`
     
Tested on a Raspberry Pi 1.2 running Raspbian Stretch Lite


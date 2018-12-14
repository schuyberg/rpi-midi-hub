
### Raspberry Pi USB MIDI Hub

Set up a Raspberry Pi as a USB/MIDI host and auto-connect devices. Adapted from Johannes Ervik's excellent guide found here: http://m635j520.blogspot.com/2017/01/using-raspberry-pi-as-midi-usb5-pin.html


Instructions:

1. Clone this repository to your home directory (on your Pi).

2. Move the `rpi-midi-hub` directory to `/etc/rpi-midi-hub` with `sudo mv ./rpi-midi-hub /etc/`  (if you have trouble, make sure it is owned by root and the .sh files are executable)

3. Set up automatic device detection:
    
    1. Connect your MIDI USB Devices.
    2. Run `lsusb` to get a list of USB devices.
    3. Look for the `idVendor:idProduct` IDs of the devices you want to auto-connect. For example: `ID 0a4d:129d` 
    4. Run the add device script for each device you want to auto-connect with 'device_name', 'idVendor', and 'idProduct' as arguments: `sudo /etc/rpi-midi-hub/add-device mpk-mini 0a4d 129d`
    5. Reload the udev rules with `sudo udevadm control --reload-rules`
     
     
Tested on a Raspberry Pi 1.2 running 


### Raspberry Pi USB MIDI Hub

Set up a Raspberry Pi as a USB/MIDI host and auto-connect devices ("brute force" approach: all devices will be connected to all other devices). Adapted from Johannes Ervik's excellent guide found here: http://m635j520.blogspot.com/2017/01/using-raspberry-pi-as-midi-usb5-pin.html and https://neuma.studio/rpi-as-midi-host.html


Instructions:

1. Clone this repository to your Raspberry Pi (home directory or wherever): `git clone https://github.com/schuyberg/rpi-midi-hub.git`.

2. Run the install script `sudo install.sh`:

    - copies 'midiconnect' scripts to  `/etc/usb-midi-hub`
    - adds USB connect/disconnect rule to `etc/udev/rules.d/`
    - runs midiconnect script
    
3. Set to run at startup with crontab:
    
    1. Open root crontab `sudo crontab -e`
    2. Add `@reboot /etc/rpi-midi-hub/midiconnect.sh` to auto-connect devices on boot.
    
4. Optional but recommended: Make the Raspberry Pi filesystem readonly to avoid corrupting important files when you yank the power cable (using https://gitlab.com/larsfp/rpi-readonly)
            
            
        git clone https://gitlab.com/larsfp/rpi-readonly
        cd rpi-readonly
        sudo ./setup.sh
        ro
        
        
Note, use `rw` to switch back to read/write mode if you need to make any more changes.
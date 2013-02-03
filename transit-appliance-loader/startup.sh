#!/bin/bash

mac=`/usr/bin/perl /etc/transit-appliance-loader/mac.pl`

#echo "the value is $mac"

while true; do
 sed -i 's/"exited_cleanly": false/"exited_cleanly": true/'  /home/pi/.config/chromium/Default/Preferences 
 chromium --no-message-box --disable-restore-session-state --disable-breakpad --disable-desktop-notifications --kiosk --incognito file:///etc/raspbian-loader/transit-appliance-loader/jsconfig/loadappliance.html
done


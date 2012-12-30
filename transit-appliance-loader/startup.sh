#!/bin/bash

mac=`/usr/bin/perl /etc/transit-appliance-loader/mac.pl`

#echo "the value is $mac"

while true; do
 #midori -e Fullscreen -a http://transitappliance.com/cgi-bin/launch_by_id_dev.pl?id=MAC:$mac
 #midori -e Fullscreen -a file:///etc/transit-appliance-loader/jsconfig/loadappliance.html
 sed -i 's/"exited_cleanly": false/"exited_cleanly": true/'  /home/pi/.config/chromium/Default/Preferences 
 #chromium --no-message-box --disable-restore-session-state --disable-breakpad --disable-desktop-notifications --kiosk --icognito http://transitappliance.com/cgi-bin/launch_by_id_dev.pl?id=MAC:$mac
 chromium --no-message-box --disable-restore-session-state --disable-breakpad --disable-desktop-notifications --kiosk --icognito file:///etc/transit-appliance-loader/jsconfig/loadappliance.html
done


#!/bin/bash

#if monitor connected
if [ $(cat /sys/class/drm/card0-DP-1/status) = "connected" ]
then
    bash "/home/rubic/Scripts/monitor/E->I_multiMonitor.sh"
else
    bash "/home/rubic/Scripts/monitor/localMonitor.sh"
fi

~/Scripts/i3/wallpaper.sh

redshift

bash escCapslockSwitch.sh

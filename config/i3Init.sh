#!/bin/bash

#if monitor connected
if [ $(cat /sys/class/drm/card0-DP-1/status) = "connected" ]
then
    bash "/home/rubic/Scripts/monitor/E->I_multiMonitor.sh"
else
    bash "/home/rubic/Scripts/monitor/localMonitor.sh"
fi

#set wallpaper
#exec ~/.i3/background/update.sh #animated background
#feh --bg-tile ~/Pictures/Wallpapers/minimal/stripedTile.png
feh --bg-fill /home/rubic/Pictures/Wallpapers/abstract/cube.jpg

bash escCapslockSwitch.sh

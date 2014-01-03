#!/bin/sh

#if monitor connected
if [ $(cat /sys/class/drm/card0-DP-1/status) = "connected" ]; then
    exec "/home/rubic/Scripts/monitor/I->E_multiMonitor.sh"
else
    exec "/home/rubic/Scripts/monitor/localMonitor.sh"
fi

#set wallpaper
#exec ~/.i3/background/update.sh #animated background
#feh --bg-tile ~/Pictures/Wallpapers/minimal/stripedTile.png
feh --bg-fill /home/rubic/Pictures/Wallpapers/abstract/cube.jpg


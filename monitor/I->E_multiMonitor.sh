#!/bin/bash
#xrandr --output DP1 --auto --output LVDS1 --auto --right-of DP1A #OLD STANDARD SETUP

#create custom display resolution for internal monitor
if [ "`xrandr | grep 688x384_60.00`" == "" ] 
then
    xrandr --newmode "688x384_60.00"   20.25  688 704 768 848  384 387 397 401 -hsync +vsync
    xrandr --addmode LVDS1 "688x384_60.00"
fi

#setup monitors
xrandr --output DP1 --auto --output LVDS1 --mode 688x384_60.00 --left-of DP1

exec ../wallpaper.sh

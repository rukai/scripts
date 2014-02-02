#!/bin/bash

if ! ps aux | grep -v grep | grep -q i3lock
then
    i3lock -c 000000 -i /home/rubic/Pictures/Wallpapers/minimal/stripedTile.png -d -t
fi

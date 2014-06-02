#!/bin/sh
export DISPLAY=:0
sleep 1s
xmodmap -e "clear lock"
xmodmap -e "keycode 9 = Caps_Lock"
xmodmap -e "keycode 66 = Escape"

#Swap RMB and LMB
#xmodmap -e "pointer = 3 2 1"

#!/bin/bash

if [ $(hostname) == "XPS-RUBIC" ]
then
    exec --no-startup-id xbacklight -set 13%

    #setup i3 for laptop
    killall i3bar
    while read line
    do
        i3-msg $line
    done < i3commands

    #run post network connect script
    sleep 20
    /home/rubic/Scripts/i3/postNetLaunch.sh
fi

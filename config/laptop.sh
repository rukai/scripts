#!/bin/bash

if [ $(hostname) == "XPS-RUBIC" ]
then
    exec --no-startup-id xbacklight -set 13%

    #run post network connect script
    sleep 20
    /home/rubic/Scripts/i3/postNetLaunch.sh
fi

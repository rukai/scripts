#!/bin/sh

cd ~
sleep 20s

if [ "$(iwgetid -r )" = "ZEUS" ]; then
    conky -dc .i3/conky/rc
    mpd
    #deluged
fi

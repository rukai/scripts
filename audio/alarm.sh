#!/bin/bash

sleep 8s #why?

cat ~/.config/mpd/playlists/wakeup.m3u | shuf -n 40 | mpc add
mpc -q play

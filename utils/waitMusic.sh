#!/bin/bash

# Waits for the current mpd song to finish before closing.
# Use like this: ./waitMusic.sh && otherCommand

old=$(mpc current)

while [ "$(mpc current)" == "${old}" ]; do
    sleep 1s
done

#!/bin/sh

#if monitor connected
if [ $(cat /sys/class/drm/card0-DP-1/status) = "connected" ]; then
    exec "/home/rubic/Scripts/monitor/I->E_multiMonitor.sh"
else
    exec "/home/rubic/Scripts/monitor/localMonitor.sh"
fi

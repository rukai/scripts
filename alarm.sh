#!/bin/sh

#Requires manual setup of music to play from within cmus

cmus-remote -C "set continue=false"

sleep ${1}h

espeak "Wakeup please!"

cmus-remote -u
sleep 5m && cmus-remote -u
sleep 5m && cmus-remote -u
sleep 5m && cmus-remote -u
sleep 5m && cmus-remote -u
sleep 5m && cmus-remote -u
sleep 5m && cmus-remote -u
sleep 5m && cmus-remote -u
sleep 5m && cmus-remote -u

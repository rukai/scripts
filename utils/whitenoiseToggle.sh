#!/bin/sh

noiseType=whitenoise

if [ "`ps aux | grep "play -n synth 60:00 $noiseType" | grep -v grep`" ]
then
    killall play
else
    nohup play -n synth 60:00 $noiseType > /dev/null &
fi


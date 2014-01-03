#Toggle Mute
amixer -q set Master toggle
sleep 4;
#fiddling with headhphone volume appears to return sound after unmute
#amixer -q set Headphone 1dB+
amixer -q set Headphone 1dB+

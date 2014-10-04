#!/bin/bash

sleep 8s #why?

mpc playlist wakeup | shuf -n 20 | mpc add
mpc -q play

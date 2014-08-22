#!/bin/bash

sleep 3s

mpc playlist wakeup | shuf -n 20 | mpc add
mpc -q play

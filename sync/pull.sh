#!/bin/sh

rsync --delete --files-from '/home/rubic/Scripts/sync/include.txt' -e ssh -ravuh rubic@xps.lan:/home/rubic/ /home/rubic

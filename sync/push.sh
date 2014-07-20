#!/bin/sh

rsync --delete --files-from '/home/rubic/Scripts/sync/include.txt' -e ssh -ravuh /home/rubic/ rubic@xps.lan:/home/rubic/

#!/bin/bash

#Need to be careful
set -e;set -u

sync="rsync --delete --files-from /home/rubic/Scripts/sync/include.txt -e ssh -ravuh rubic@xps.lan:/home/rubic/ /home/rubic"

# Confirm files to be pulled
$sync --dry-run
read -p "Confirm sync? [y/n] " confirm

# Run actual sync
if [ "$confirm" == "y" ]
then
    $sync
fi

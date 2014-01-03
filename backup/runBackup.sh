#!/bin/sh

rsync -avh --delete --delete-excluded --exclude-from '/home/rubic/Scripts/backup/exclude.txt' -e ssh /home/rubic/ rubic@192.168.1.7:/home/rubic/XPS-Backup/

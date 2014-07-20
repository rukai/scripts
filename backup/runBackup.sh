#!/bin/sh

#create local sources for global config
cd configBackup
rsync /etc/ etc/
pacman -Qqen > pacmanList.txt

#backup to remote server
cd ..
rsync -avuh --delete --delete-excluded --exclude-from '/home/rubic/Scripts/backup/exclude.txt' -e ssh /home/rubic/ rubic@192.168.1.7:/home/rubic/XPS-Backup/

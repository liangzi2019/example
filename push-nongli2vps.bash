#!/bin/sh
rsync -avrz /home/xuan/nfs_share/golang/nongli --log-file=/home/xuan/logs/tengxunyun.log --delete-excluded -e "sshpass -p password ssh -p port" username@ipaddr:/home/ubuntu/golang/

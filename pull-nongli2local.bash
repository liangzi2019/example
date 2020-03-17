#!/bin/sh
rsync -avrz --log-file=/home/xuan/logs/tengxunyun.log --delete-excluded -e "sshpass -p password ssh -p 23333" username@ipaddr:/home/ubuntu/golang/nongli  /home/xuan/nfs_share/

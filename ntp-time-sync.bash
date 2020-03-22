#!/bin/sh

### 时间校对脚本　
### CentOS6.8 + openSUSE15.0 + Ubuntu

net_time_SuSE() {
	
	zypper in -y netdate
	systemctl stop ntpd.service
	sleep 3
	ntpdate us.pool.ntp.org && echo "$(date) verify donw ..." >> /var/log/ntp-sync.log 2>&1
	systemctl start ntpd.service
	date -u

}

net_time_CentOS() {

	# yum install ntp ntpdate -y
	/etc/init.d/ntpd stop
	sleep 3
	ntpdate us.pool.ntp.org && echo "$(date) verify donw ..." >> /var/log/ntp-sync.log 2>&1
	/etc/init.d/ntpd start
	date -u

}

net_time_Ubuntu() {

	apt install -y ntpdate ntp
	/etc/init.d/ntp stop
	sleep 3
	ntpdate us.pool.ntp.org && echo "$(date) verify donw ..." >> /var/log/ntp-sync.log 2>&1
	/etc/init.d/ntp start
	date -u

}

os_name=$(lsb_release -si)
os_name1=$(cat /etc/redhat-release | awk '{print $1}')
net_time_sync() {
	if [ "$os_name" = "openSUSE" ];then
		echo "OS is $os_name $(date) verify time now..." >> /var/log/ntp-sync.log
		net_time_SuSE
	elif [ "$os_name1" = "CentOS" ];then
		echo "OS is $os_name1 $(date) verify time now ..." >> /var/log/ntp-sync.log
		net_time_CentOS
	elif [ "$os_name" = "Ubuntu" ];then
		echo "OS is $os_name $(date) verify time now..." >> /var/log/ntp-sync.log
		net_time_Ubuntu
	fi
}


Action() {

	if [ "$(whoami)" = "root" ];then
		net_time_sync
	else
		echo "need root"
	fi
}

Action

#!/bin/bash
#coding:utf-8
#title:wifipass.sh
#author:hacknonym
#launch:./wifipass.sh   |or|   bash wifipass.sh   |or|   . wifipass.sh

#terminal text color code
grey='\e[0;37m'
greenb='\e[0;32;1m'
redb='\e[0;31;1m'

PATH_AP="/etc/NetworkManager/system-connections"
CURRENT_PATH=$(pwd)
#LOG_FILE="wifipass.log"

#touch $CURRENT_PATH/$LOG_FILE
#echo -n "" > $CURRENT_PATH/$LOG_FILE

for i in $(ls -l $PATH_AP | grep -e ":" | cut -d ':' -f 2 | cut -c 4- | tr ' ' '_') ; do
  ap=$(echo -e "$i" | tr '_' ' ')
  ssid=$(cat $PATH_AP/"$ap" | grep -e "ssid=" | cut -d '=' -f 2-)
  pass=$(cat $PATH_AP/"$ap" | grep -e "psk=" | cut -d '=' -f 2-)

  echo -e "ESSID: $ssid" #>> $CURRENT_PATH/$LOG_FILE
  echo -e "PWD: $pass\n" #>> $CURRENT_PATH/$LOG_FILE
done

#if [ ! -x $CURRENT_PATH/$LOG_FILE ] ; then
#  echo -e "$greenb[+]$grey Output file save > $CURRENT_PATH/$LOG_FILE"
#else
#  echo -e "$redb[x]$grey No password found"
#fi

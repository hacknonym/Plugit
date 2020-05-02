#!/bin/bash
#coding:utf-8
#title:install.sh
#author:hacknonym
#launch:./install.sh   |or|   bash install.sh   |or|   . install.sh

#terminal text color code
grey='\e[0;37m'
greenb='\e[0;32;1m'
redb='\e[0;31;1m'
yellowb='\e[0;33;1m'
blueb='\e[0;34;1m'

CURRENT_PATH=$(pwd)
TOTAL=7

ping -c 1 8.8.4.4 1> /dev/null 2>&1 || { echo -e "$redb[x]$grey No Internet connection"; exit 1; }

cd $CURRENT_PATH

chmod +x $CURRENT_PATH/wifipass/wifipass.sh
chmod +x $CURRENT_PATH/searchfile//searchfile/.sh

echo -e "$greenb[+]$grey [1/$TOTAL] LaZagne local installation..."
git clone --quiet https://github.com/AlessandroZ/LaZagne.git

echo -e "$greenb[+]$grey [2/$TOTAL] linPEAS local installation..."
git clone --quiet https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git

echo -e "$greenb[+]$grey [3/$TOTAL] mimipenguin local installation..."
git clone --quiet https://github.com/huntergregal/mimipenguin.git

echo -e "$greenb[+]$grey [4/$TOTAL] LinEnum local installation..."
git clone --quiet https://github.com/rebootuser/LinEnum.git

echo -e "$greenb[+]$grey [5/$TOTAL] cmospwd local installation..."
git clone --quiet https://github.com/foreni-packages/cmospwd.git
cd cmospwd/src/
make 1> /dev/null 2>&1
cd $CURRENT_PATH

echo -e "$greenb[+]$grey [6/$TOTAL] crunch local installation..."
git clone --quiet https://github.com/crunchsec/crunch.git
cd crunch/
make 1> /dev/null 2>&1
cd $CURRENT_PATH

echo -e "$greenb[+]$grey [7/$TOTAL] nmap local installation..."
git clone --quiet https://github.com/nmap/nmap.git
cd nmap/
./configure 1> /dev/null 2>&1
make 1> /dev/null 2>&1
make 1> /dev/null 2>&1
cd $CURRENT_PATH

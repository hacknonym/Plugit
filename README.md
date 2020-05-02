# Plugit

[![Version](https://img.shields.io/badge/Version-1.0-blue)]()
[![Language](https://img.shields.io/badge/Bash-4.2%2B-brightgreen)]()
[![Available](https://img.shields.io/badge/Available-Linux%20Linux-red)]()
[![Download](https://img.shields.io/badge/Size-22Ko-brightgreen)]()
[![License](https://img.shields.io/badge/License-GPL%20v3%2B-red)]()

### Author: github.com/hacknonym

##  A tool for physical attacks

![Banner]()

**Plugit** is a compact multi purpose tool for physical attacks. #plugit #physical-attack

## Features !
- Choose the number of terminals to open to execute several tasks at the same time
- Enumeration of the system
	* [LaZagne](https://github.com/AlessandroZ/LaZagne)
	* [linPEAS](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite)
	* [mimipenguin](https://github.com/huntergregal/mimipenguin)
	* [LinEnum](https://github.com/rebootuser/LinEnum)
- Search important files using keywords
- Scan the network [nmap (local installation)](https://github.com/nmap/nmap)
- Destroy system
	* Remove '/' of the system
	* ForkBomb command
	* Flushing the hard drive
	* Fill hard drive with zeros
	* Creating a black hole in hard drive
	* Remove boot partition
	* Saturate memory [crunch (local installation)](https://github.com/crunchsec/crunch)
- Create a new user
- Change the password of the current user
- Create an SSH server
- Clear logs
- Reset BIOS [cmospwd (local installation)](https://github.com/foreni-packages/cmospwd)

## Usage protocol
Start the installation from a USB key (**2GB** sufficient).<br/>
USB key name must not contain spaces.

## Installation
Necessary to have root rights
```bash
git clone https://github.com/hacknonym/Plugit.git
cd Plugit
chmod +x install.sh
chmod +x plugit.sh
./install.sh
```
### Usage 
```bash
cd Plugit
./plugit.sh <NB_Terminal>		# Default 1
```

## Tools Overview
![Launch](https://user-images.githubusercontent.com/55319869/80891437-4659f280-8cc4-11ea-9925-27b140f5a6ff.png)
![Search files]()
![Destroy system]()

## License
GNU General Public License v3.0 for Plugit
AUTHOR: @hacknonym

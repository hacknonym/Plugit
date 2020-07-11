# LinPlugit

[![Version](https://img.shields.io/badge/Version-1.0-orange.svg?style=for-the-badge)]()
[![Language](https://img.shields.io/badge/Bash-4.2%2B-brightgreen.svg?style=for-the-badge)]()
[![Available](https://img.shields.io/badge/Available-Linux-red.svg?style=for-the-badge)]()
[![Download](https://img.shields.io/badge/Size-22Ko-brightgreen.svg?style=for-the-badge)]()
[![License](https://img.shields.io/badge/License-GPL%20v3%2B-red.svg?style=for-the-badge)]()

### Author: github.com/hacknonym

##  A tool for physical attacks

![Banner](https://user-images.githubusercontent.com/55319869/87228370-1a807a80-c3a1-11ea-8b7d-229ff490ec76.PNG)

**Plugit** is a compact multi purpose tool for physical attacks. #plugit #physical-attack #LinPlugit

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
Run multiple tasks simultaneously
```bash
cd Plugit
./plugit.sh <NB_Terminal>		# Default 1
```

## Tools Overview
![Launch](https://user-images.githubusercontent.com/55319869/80914392-87491a00-8d4b-11ea-92a3-79fa268f2ce1.png)
![Search files](https://user-images.githubusercontent.com/55319869/80914426-b2336e00-8d4b-11ea-9954-c637b37444de.png)
![Destroy system](https://user-images.githubusercontent.com/55319869/80914399-8fa15500-8d4b-11ea-80a5-ca88e3480b1f.png)

## License
GNU General Public License v3.0 for Plugit
AUTHOR: @hacknonym


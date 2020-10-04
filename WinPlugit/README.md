# WinPlugit

[![Version](https://img.shields.io/badge/Version-1.0-orange.svg?style=for-the-badge)]()
[![Available](https://img.shields.io/badge/Available-Windows-blue.svg?style=for-the-badge)]()
[![Download](https://img.shields.io/badge/Size-70Mo-brightgreen.svg?style=for-the-badge)]()
[![License](https://img.shields.io/badge/License-GPL%20v3%2B-red.svg?style=for-the-badge)]()

### Author: github.com/hacknonym

##  A tool for physical attacks

![Banner](https://user-images.githubusercontent.com/55319869/87228368-194f4d80-c3a1-11ea-91ab-195b059f9a88.PNG)

**Plugit** is a compact multi purpose tool for physical attacks. #plugit #physical-attack #WinPlugit

## Features !
- Choose the number of terminals to open to execute several tasks at the same time
- Enumeration of the system
	* [Password Recovery Utilities](https://www.nirsoft.net/utils/) (BulletsPassView, ChromePass, iepv, mailpv, mspass, netpass, OperaPassView, PasswordFox, ProduKey, pspv, PstPassword, rdpv, RouterPassView, VNCPassView, WebBrowserPassView, WirelessKeyView, WNetWatcher)
	* [mimikatz](https://github.com/gentilkiwi/mimikatz/)
	* [wce](https://github.com/returnvar/wce)
	* [winPEAS](https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite)
	* [WindowsEnum](https://github.com/absolomb/WindowsEnum)
	* [SeatBelt](https://github.com/GhostPack/Seatbelt)
	* [SharpWeb](https://github.com/djhohnstein/SharpWeb)
	* [LaZagne](https://github.com/AlessandroZ/LaZagne)
	* [SharpShares](https://github.com/djhohnstein/SharpShares)
	* [Watson](https://github.com/rasta-mouse/Watson)
- Search important files using keywords
- Scan the network [IPv4NetworkScanner](https://github.com/BornToBeRoot/PowerShell_IPv4NetworkScanner)
- Privileges escalation
	* [Exploits](https://github.com/WindowsExploits/Exploits) (CVE-2012-0217, CVE-2016-3309, CVE-2016-3371, CVE-2016-7255, CVE-2017-0213)
- Destroy system (not yet functional)
- Create an admin user
- Change the password of the current user
- Install programs
	* [SSH Server - Bitvise](https://www.bitvise.com/ssh-server-download)
	* [FTP Server - Filezilla](https://filezilla-project.org/download.php?type=server)
	* [VNC Server - TightVNC](https://tightvnc.com/)
	* [Telnet Server - Pragma Systems](https://www.pragmasys.com/telnet-server)
	* Shadow Keylogger
	* BadBlue
	
### Using BadBlue
```bash
$> sudo msfconsole -q
msf5 > use exploit/windows/http/badblue_passthru
msf5 > set RPORT 80
msf5 > set RHOSTS <VICTIM_IP>
msf5 > exploit
```

## Usage protocol
Start the installation from a USB key (**2GB** sufficient).<br/>

### Usage
Before plugging the USB key, try to deactivate the antivirus<br/>
Simply launch the program **Launch.bat** or from the Command Prompt **cmd**
```PowerShell
powershell -ExecutionPolicy Bypass -File .\plugit.ps1 -nb <NB_Terminal>		# Default 1
```

## Tools Overview
![Launch](https://user-images.githubusercontent.com/55319869/87228335-d5f4df00-c3a0-11ea-91cb-3907a646a290.PNG)
![Search files](https://user-images.githubusercontent.com/55319869/87228347-ec029f80-c3a0-11ea-901b-6037e1a8f6d0.PNG)
![Install Programs](https://user-images.githubusercontent.com/55319869/87228342-e0af7400-c3a0-11ea-8027-3815fd4e450c.PNG)

## License
GNU General Public License v3.0 for Plugit
AUTHOR: @hacknonym


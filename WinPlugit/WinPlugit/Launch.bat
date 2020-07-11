@echo off
cls
set /a number=1
echo If possible, disable antivirus manually
set /p number= Number of windows ^> 
powershell -Exec Bypass -File .\plugit.ps1 -nb %number%

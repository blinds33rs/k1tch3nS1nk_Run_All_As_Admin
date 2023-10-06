@echo off
setlocal enabledelayedexpansion
color 0A
mode con: cols=100 lines=40

:: Cyberpunk-style intro
echo Initializing interface to cyberspace...
timeout /t 2 >nul

echo Tapping into the consensual hallucination experienced by billions...
timeout /t 2 >nul

echo Abstracting data from every computational node in the human system...
timeout /t 2 >nul

:: Countdown function before resetting
echo Preparing to reset network configurations...
for /l %%i in (10,-1,1) do (
    cls
    echo Time before reset: %%i seconds
    timeout /t 1 >nul
)

:: Reset TCP/IP stack
echo Resetting the TCP/IP stack in the nonspace of the mind...
netsh int ip reset
timeout /t 2 >nul

:: Release and renew DHCP lease
echo Releasing and renewing DHCP lease, like city lights receding...
ipconfig /release
timeout /t 2 >nul
ipconfig /renew
timeout /t 2 >nul

:: Flush DNS cache
echo Flushing DNS cache, clearing constellations of data...
ipconfig /flushdns
timeout /t 2 >nul

:: Reset Winsock
echo Resetting Winsock, hacking through the security apparatus...
netsh winsock reset
timeout /t 2 >nul

:: Disable and re-enable all network adapters
echo Disabling all network adapters, tracking a soulless tropism to zero control... Estimated time: 7 seconds
for /f "tokens=4 delims= " %%i in ('netsh interface show interface ^| findstr /C:"Enabled"') do (
    netsh interface set interface "%%i" admin=disable
)
timeout /t 5 >nul

echo Enabling all network adapters, assembling from the enemy's resources... Estimated time: 2 seconds
for /f "tokens=4 delims= " %%i in ('netsh interface show interface ^| findstr /C:"Disabled"') do (
    netsh interface set interface "%%i" admin=enable
)
timeout /t 2 >nul

:: Notify the user that the system will restart
echo Begin system reboot. Force reboot in 2 minutes...

:: Countdown from 120 to 0
for /l %%i in (120,-1,1) do (
    cls
    echo Time before reset: %%i seconds
    timeout /t 1 >nul
)
echo Commencing forced system reboot...
shutdown /r /t 0 /f

:: Restore local environment
endlocal
@echo on

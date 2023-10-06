@echo off
setlocal enabledelayedexpansion

:: Check if running as administrator
net session >nul 2>&1 || (
    echo Please run this script as an administrator.
    pause >nul
    exit /b
)

:: ---------------------------------- Header ----------------------------------
echo ----------------------------------------------------------------------------------
echo The cyber-shaman commences the neural net enhancement... (Estimated time: 10 minutes)
echo ----------------------------------------------------------------------------------

:: --------------------- Section 1: Terminate Unwanted Processes ---------------------
:: Terminate Microsoft Office processes (Estimated time: 5 seconds)
echo Silencing the murmurs of Office spirits...
taskkill /F /IM excel.exe /IM winword.exe /IM powerpnt.exe /IM outlook.exe /IM mspub.exe /IM visio.exe /IM teams.exe >nul 2>&1 && (
    echo All Microsoft Office processes terminated.
) || (
    echo No Microsoft Office processes found.
)

:: Terminate common web browsers and text editors (Estimated time: 5 seconds)
echo Silencing murmurs of common applications...
taskkill /F /IM chrome.exe /IM firefox.exe /IM iexplore.exe /IM msedge.exe /IM notepad.exe /IM notepad++.exe /IM wordpad.exe >nul 2>&1 && (
    echo All common web browsers and text editors terminated.
) || (
    echo No common web browsers and text editors found.
)

:: Section 2: Initial Wait and Timestamp (Estimated time: 1 minute)
echo Prepare your algorithms! The neural net calibration will begin in 1 minute.

for /l %%i in (60,-1,1) do (
    cls
    echo Time before reset: %%i seconds
    timeout /t 1 >nul
)

:: Generate a timestamp for backup files (Estimated time: 1 second)
set TIMESTAMP=%DATE:~-4,4%%DATE:~-10,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2% || (
    echo Failed to set timestamp.
    pause >nul
)

:: Section 4: Service Operations (Estimated time: 2 minutes)
echo The Oracle recalibrates the realm of knowledge...
net stop "WSearch" >nul 2>&1 || (
    echo Failed to stop WSearch service.
    pause >nul
)

echo Rewiring the ghostly print circuits...
net stop spooler

:: Removed the line that stops the NlaSvc service
echo Re-establishing connections in the sprawl...
net stop Dhcp

echo Purging poisoned data from the city's neural pathways...
net stop Dnscache

:: Reset TCP/IP stack (Estimated time: 5 seconds)
echo Resetting the TCP/IP stack in the nonspace of the mind...
netsh int ip reset
timeout /t 2 >nul

:: Release and renew DHCP lease (Estimated time: 10 seconds)
echo Releasing and renewing DHCP lease, like city lights receding...
ipconfig /release
timeout /t 2 >nul
ipconfig /renew
timeout /t 2 >nul

:: Flush DNS cache (Estimated time: 5 seconds)
echo Flushing DNS cache, clearing constellations of data...
ipconfig /flushdns
timeout /t 2 >nul

:: Reset Winsock (Estimated time: 5 seconds)
echo Resetting Winsock, hacking through the security apparatus...
netsh winsock reset
timeout /t 2 >nul

:: Disable and re-enable all network adapters (Estimated time: 9 seconds)
echo Disabling all network adapters, tracking a soulless tropism to zero control...
for /f "tokens=4 delims= " %%i in ('netsh interface show interface ^| findstr /C:"Enabled"') do (
    netsh interface set interface "%%i" admin=disable
)
timeout /t 5 >nul

echo Enabling all network adapters, assembling from the enemy's resources...
for /f "tokens=4 delims= " %%i in ('netsh interface show interface ^| findstr /C:"Disabled"') do (
    netsh interface set interface "%%i" admin=enable
)
timeout /t 2 >nul

:: System health checks (Estimated time: 5 minutes)
echo Summoning arcane codes to optimize the neural net...
sfc /scannow

echo Calling machine learning spirits for system optimization...
DISM /Online /Cleanup-Image /RestoreHealth

:: Disk operations (Estimated time: 10 minutes)
for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\ (
        echo Combing through the alleys of disk %%d...
        cleanmgr /sagerun:1 /d %%d >nul 2>&1

        echo Healing rifts in the %%d drive's concrete jungle...
        echo y| chkdsk %%d: /f /r >nul 2>&1

        echo Sweeping the fragmented memories of %%d drive...
        defrag %%d: /O >nul 2>&1
    )
)

:: Browser cleanup (Estimated time: 2 minutes)
echo Starting browser cache cleanup...

:: Chrome
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" (
    echo Purging deceptive reflections from the Chrome mirrors...
    del /S /F /Q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache*.*"
)

:: Firefox
if exist "%LOCALAPPDATA%\Mozilla\Firefox\Profiles" (
    echo Purging deceptive reflections from the Firefox mirrors...
    del /S /F /Q "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*\cache2\*.*"
)

:: Safari (Windows version, not commonly used)
if exist "%APPDATA%\Apple Computer\Safari\Cache.db" (
    echo Purging deceptive reflections from the Safari mirrors...
    del /F /Q "%APPDATA%\Apple Computer\Safari\Cache.db"
)

:: Edge
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" (
    echo Purging deceptive reflections from the Edge mirrors...
    del /S /F /Q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache*.*"
)

echo Browser cache cleanup complete.

:: Teams cleanup (Estimated time: 2 minutes)
echo Banishing lingering specters from Teams' digital sanctuaries...
del /F /S /Q "%APPDATA%\Microsoft\Teams\Cache\*.*"
del /F /S /Q "%APPDATA%\Microsoft\Teams\blob_storage\*.*"
del /F /S /Q "%APPDATA%\Microsoft\Teams\databases\*.*"
del /F /S /Q "%APPDATA%\Microsoft\Teams\IndexedDB\*.*"
del /F /S /Q "%APPDATA%\Microsoft\Teams\Local Storage\*.*"
del /F /S /Q "%APPDATA%\Microsoft\Teams\tmp\*.*"

:: Clearing MS Office caches (Estimated time: 2 minutes)
echo Exorcising the residual memories of Office spirits...
del /F /S /Q "%APPDATA%\Microsoft\Office\Recent\*.*"
del /F /S /Q "%APPDATA%\Microsoft\Excel\XLSTART\*.*"


:: Stop USB services (if they exist)
echo.
echo Stopping USB services...
net stop usbstor /y
net stop usbhub /y

:: Disable USB ports
echo.
echo Disabling USB ports...
reg add HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 4 /f

:: Wait for 5 seconds
echo.
echo Waiting for 5 seconds...
timeout /t 5

:: Enable USB ports
echo.
echo Enabling USB ports...
reg add HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 3 /f

:: Start USB services (if they exist)
echo.
echo Starting USB services...
net start usbstor
net start usbhub

:: Reinstall usb.inf driver
echo.
echo Reinstalling usb.inf driver...
pnputil.exe -i -a C:\Windows\INF\usb.inf

echo Neural net enhancement protocols complete. Systems at peak performance.

:: --------------------- Section 7: Create Restore Point ---------------------
:: Create a Restore Point for safety
echo.
echo Creating a Restore Point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Pre-Enhancement", 100, 7

:: ---------------------------------- Footer ----------------------------------
:: Section 1: Restart (Estimated time: 2 minutes)

:: Notify the user that the system will restart
echo Begin system reboot. Force reboot in 2 minutes...

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

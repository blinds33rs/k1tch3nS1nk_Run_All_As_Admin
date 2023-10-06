@echo off
setlocal enabledelayedexpansion

:: Title and initial message
title Reset USB Ports
echo This script will reset all USB ports on your Windows 10 system.
echo Make sure to save all work and close any open applications before proceeding.
pause

:: Function to check last command status and exit if failed
:checkStatus
if %errorlevel% neq 0 (
    echo An error occurred. Exiting...
    exit /b %errorlevel%
)

:: Stop USB services
echo.
echo Stopping USB services...
net stop usbstor /y
call :checkStatus

net stop usbhub /y
call :checkStatus

:: Disable USB ports
echo.
echo Disabling USB ports...
reg add HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 4 /f
call :checkStatus

:: Wait for 5 seconds
echo.
echo Waiting for 5 seconds...
timeout /t 5

:: Enable USB ports
echo.
echo Enabling USB ports...
reg add HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v Start /t REG_DWORD /d 3 /f
call :checkStatus

:: Start USB services
echo.
echo Starting USB services...
net start usbstor
call :checkStatus

net start usbhub
call :checkStatus

:: Completion message
echo.
echo USB ports have been reset successfully.
pause

:: End of script
exit /b 0
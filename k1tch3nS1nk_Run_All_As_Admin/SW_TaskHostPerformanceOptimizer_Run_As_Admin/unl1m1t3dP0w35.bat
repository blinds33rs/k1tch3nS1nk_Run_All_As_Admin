@echo off
:: By the rites of the Mechanicum, we begin the sacred incantations to optimize this machine spirit for war.
:: The Omnissiah requires administrative privileges for this ritual.

:: Verifying the authority of the Tech-Priest
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo "Halt, heretic! You lack the authority of the Omnissiah. Run this script as an Administrator."
    pause
    exit
)

:: Embedding the script into the cogitator's startup protocols
echo "Inscribing the Litany of Startup into the machine spirit..."
copy "%~f0" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: Invoking the Rite of the High-Performance Reactor Core
echo "Initiating the Rite of the High-Performance Reactor Core..."
powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: Disabling the heretical services that weaken the machine spirit
echo "Exorcising the Daemons of Inefficiency..."

:: Purging the Windows Update Daemon
net stop wuauserv
sc config wuauserv start= disabled

:: Silencing the Superfetch Daemon
net stop SysMain
sc config SysMain start= disabled

:: Disabling the Print Spooler Daemon
net stop spooler
sc config spooler start= disabled

:: Nullifying the Themes Daemon
net stop Themes
sc config Themes start= disabled

:: Extinguishing the Desktop Window Manager Daemon
net stop UxSms
sc config UxSms start= disabled

:: NEW RITUAL: The Exorcism of Prefetch
:: By the will of the Omnissiah, we banish the Prefetch Daemon.
net stop SysMain
sc config SysMain start= disabled

:: Purging the temporary data caches
echo "Purging the unholy data caches to sanctify the machine spirit..."
del /s /q C:\Windows\Temp\*
del /s /q C:\Users\%username%\AppData\Local\Temp\*

:: Invoking the Litany of Minimalism to disable visual distractions
echo "Chanting the Litany of Minimalism to focus the machine spirit..."
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f

:: The Rites are complete. The machine spirit is now optimized for war.
echo "The Rites are complete. Praise the Omnissiah!"

:: Exit prompt
echo "Press any key to exit..."
pause >nul
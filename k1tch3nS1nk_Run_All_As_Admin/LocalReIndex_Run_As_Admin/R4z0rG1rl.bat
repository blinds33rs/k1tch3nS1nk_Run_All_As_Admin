@echo off
setlocal enabledelayedexpansion
color 0A

:: ------------------------------
:: Matrix-Level Privileges Check
:: ------------------------------
echo Checking for matrix-level privileges...
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '1' (
    echo [ACCESS DENIED] Jack in as an admin, console cowboy.
    timeout /t 60
    exit /b 1
)

:: ------------------------------
:: Datanet Pathways Status Check
:: ------------------------------
echo Checking the status of the datanet pathways...
sc query "WSearch" | find /i "RUNNING"
if "%ERRORLEVEL%" NEQ "0" (
    echo [ERROR] The datanet pathways are already down. Ensure WSearch service is running.
    timeout /t 60
    exit /b 6
)

:: ------------------------------
:: Datanet Shutdown
:: ------------------------------
echo Unplugging from the datanet stream...
net stop "WSearch"
timeout /t 10

:: ------------------------------
:: Erase Old Data Streams
:: ------------------------------
echo Erasing traces from the old matrix...
if exist "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb" (
    del /F /Q "C:\ProgramData\Microsoft\Search\Data\Applications\Windows\Windows.edb"
)

:: ------------------------------
:: Disable Unnecessary Indexing
:: ------------------------------
echo Disabling unnecessary indexing...
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v "DisableSystemIndexer" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v "DisableAddRemovePrograms" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v "DisableStartMenu" /t REG_DWORD /d 1 /f

:: ------------------------------
:: Rejack into the Matrix
:: ------------------------------
echo Rejacking into the matrix...
net start "WSearch"
timeout /t 10

:: ------------------------------
:: Confirm Datanet Status
:: ------------------------------
echo Confirming WSearch service status...
sc query "WSearch"

:: ------------------------------
:: Script Completion
:: ------------------------------
echo We're in. The matrix is re-wiring. Let the new data streams flow.
echo Stay frosty, don't jack out until the pathways are fully lit.

:: ---------------------------------- Footer ----------------------------------
:: Section 7: Restart (Estimated time: 2 minutes)

:: Notify the user that the system will restart
echo Begin system reboot. Force reboot in 2 minutes...

:: Countdown from 120 to 0
for /l %%i in (120,-1,1) do (
    echo|set /p="Force reboot commencing in %%i seconds... "
    timeout /t 1 >nul
    echo.
)
echo Commencing forced system reboot...
shutdown /r /t 0 /f

:: Restore local environment
endlocal
@echo on
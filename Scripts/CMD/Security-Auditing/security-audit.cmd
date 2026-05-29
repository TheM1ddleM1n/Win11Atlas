@echo off
:menu
cls
echo === Security Audit ===
echo.
echo 1. Audit Policy
echo 2. Firewall Status
echo 3. Open Ports
echo 4. Shared Resources
echo 5. Exit
echo.
choice /c 12345 /n /m "Select option: "

if errorlevel 5 exit /b
if errorlevel 4 goto shares
if errorlevel 3 goto ports
if errorlevel 2 goto firewall
if errorlevel 1 goto audit

:audit
cls
echo === Audit Policy ===
auditpol /get /category:*
pause
goto menu

:firewall
cls
echo === Firewall Status ===
netsh advfirewall show allprofiles
pause
goto menu

:ports
cls
echo === Open Ports ===
netstat -an | findstr LISTENING
pause
goto menu

:shares
cls
echo === Shared Resources ===
net share
pause
goto menu

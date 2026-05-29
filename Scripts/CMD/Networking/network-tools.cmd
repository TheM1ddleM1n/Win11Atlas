@echo off
:menu
cls
echo === Network Tools ===
echo.
echo 1. Ping Test
echo 2. Trace Route
echo 3. Show ARP Table
echo 4. Flush DNS Cache
echo 5. Show Network Info
echo 6. Exit
echo.
choice /c 123456 /n /m "Select option: "

if errorlevel 6 exit /b
if errorlevel 5 goto netinfo
if errorlevel 4 goto flushdns
if errorlevel 3 goto arp
if errorlevel 2 goto tracert
if errorlevel 1 goto ping

:ping
cls
set /p HOST=Enter hostname or IP to ping:
ping -n 4 %HOST%
pause
goto menu

:tracert
cls
set /p HOST=Enter hostname or IP:
tracert %HOST%
pause
goto menu

:arp
cls
echo === ARP Table ===
arp -a
pause
goto menu

:flushdns
cls
echo === Flushing DNS Cache ===
ipconfig /flushdns
pause
goto menu

:netinfo
cls
echo === Network Info ===
ipconfig /all
echo.
echo === Active Connections ===
netstat -ano
echo.
pause
goto menu

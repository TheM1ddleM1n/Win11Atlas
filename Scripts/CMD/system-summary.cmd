@echo off
echo === System Summary ===
echo Hostname: %COMPUTERNAME%
echo User: %USERNAME%
echo Date: %DATE%
echo Time: %TIME%
echo.
echo Windows Version:
ver
echo.
echo Uptime:
net statistics workstation | findstr /i "since"
echo.
pause

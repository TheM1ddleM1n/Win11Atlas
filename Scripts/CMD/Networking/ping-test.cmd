@echo off
echo === Ping Test ===
set /p HOST=Enter hostname or IP to ping:
ping -n 4 %HOST%
pause

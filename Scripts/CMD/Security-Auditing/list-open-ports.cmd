@echo off
echo === Open Ports ===
netstat -an | findstr LISTENING
pause

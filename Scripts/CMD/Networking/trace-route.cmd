@echo off
echo === Trace Route ===
set /p HOST=Enter hostname or IP:
tracert %HOST%
pause

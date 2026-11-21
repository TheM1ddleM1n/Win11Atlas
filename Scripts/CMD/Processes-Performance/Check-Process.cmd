@echo off
set /p PROCNAME=Enter process name (without .exe):
echo.
echo === Checking for: %PROCNAME% ===
echo.
tasklist /fi "IMAGENAME eq %PROCNAME%.exe" /fo table
pause

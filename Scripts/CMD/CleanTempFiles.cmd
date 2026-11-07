@echo off
echo Cleaning temporary files...
del /q /f /s "%temp%\*.*"
del /q /f /s "C:\Windows\Temp\*.*"
echo Cleanup finished!
pause

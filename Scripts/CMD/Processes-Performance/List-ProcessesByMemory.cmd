@echo off
echo === Processes by Memory Usage ===
echo.
wmic process get Name,ProcessId,WorkingSetSize /format:table | sort /r /+56
pause

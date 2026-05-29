@echo off
echo === Disk Usage ===
wmic logicaldisk get name, size, freespace
pause

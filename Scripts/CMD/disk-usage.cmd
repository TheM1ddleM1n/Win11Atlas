@echo off
echo === Disk Usage ===
wmic logicaldisk get caption,volumename,size,freespace /format:list
pause

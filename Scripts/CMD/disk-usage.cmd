@echo off
echo === Your Disk Usage ===
wmic logicaldisk get caption,volumename,size,freespace /format:list
pause

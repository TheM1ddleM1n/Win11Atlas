@echo off
:menu
cls
echo === Win11Atlas CMD Launcher ===
echo.
echo  1. Networking
echo  2. Security and Auditing
echo  3. User and Group Management
echo  4. Processes and Performance
echo  5. File and Disk Management
echo  6. Registry
echo  7. Event Logs
echo  8. Scheduled Tasks
echo  9. Exit
echo.
set /p CHOICE=Select category:
if "%CHOICE%"=="1" goto networking
if "%CHOICE%"=="2" goto security
if "%CHOICE%"=="3" goto users
if "%CHOICE%"=="4" goto processes
if "%CHOICE%"=="5" goto files
if "%CHOICE%"=="6" goto registry
if "%CHOICE%"=="7" goto events
if "%CHOICE%"=="8" goto tasks
if "%CHOICE%"=="9" exit
goto menu

:networking
cls
echo === Networking ===
echo  1. Ping Test
echo  2. Trace Route
echo  3. Show Connections
echo  4. Flush DNS
echo  5. Show ARP Table
echo  6. Back
echo.
set /p C=Select:
if "%C%"=="1" call "%~dp0Networking\ping-test.cmd"
if "%C%"=="2" call "%~dp0Networking\trace-route.cmd"
if "%C%"=="3" call "%~dp0Networking\show-connections.cmd"
if "%C%"=="4" call "%~dp0Networking\flush-dns.cmd"
if "%C%"=="5" call "%~dp0Networking\show-arp.cmd"
if "%C%"=="6" goto menu
goto networking

:security
cls
echo === Security and Auditing ===
echo  1. List Open Ports
echo  2. Check Firewall
echo  3. Audit Policy
echo  4. List Shares
echo  5. Back
echo.
set /p C=Select:
if "%C%"=="1" call "%~dp0Security-Auditing\list-open-ports.cmd"
if "%C%"=="2" call "%~dp0Security-Auditing\check-firewall.cmd"
if "%C%"=="3" call "%~dp0Security-Auditing\audit-policy.cmd"
if "%C%"=="4" call "%~dp0Security-Auditing\list-shares.cmd"
if "%C%"=="5" goto menu
goto security

:users
cls
echo === User and Group Management ===
echo  1. List Users
echo  2. List Groups
echo  3. Current User Detail
echo  4. Last Logons
echo  5. Back
echo.
set /p C=Select:
if "%C%"=="1" call "%~dp0User-Group-Management\list-users.cmd"
if "%C%"=="2" call "%~dp0User-Group-Management\list-groups.cmd"
if "%C%"=="3" call "%~dp0User-Group-Management\whoami-detail.cmd"
if "%C%"=="4" call "%~dp0User-Group-Management\last-logons.cmd"
if "%C%"=="5" goto menu
goto users

:processes
cls
echo === Processes and Performance ===
echo  1. List Processes
echo  2. Top CPU Usage
echo  3. Kill Process
echo  4. System Performance
echo  5. Back
echo.
set /p C=Select:
if "%C%"=="1" call "%~dp0Processes-Performance\list-processes.cmd"
if "%C%"=="2" call "%~dp0Processes-Performance\top-cpu.cmd"
if "%C%"=="3" call "%~dp0Processes-Performance\kill-process.cmd"
if "%C%"=="4" call "%~dp0Processes-Performance\system-perf.cmd"
if "%C%"=="5" goto menu
goto processes

:files
cls
echo === File and Disk Management ===
echo  1. Disk Usage
echo  2. Find Large Files
echo  3. Directory Tree
echo  4. Check Disk
echo  5. Back
echo.
set /p C=Select:
if "%C%"=="1" call "%~dp0File-Disk-Management\disk-usage.cmd"
if "%C%"=="2" call "%~dp0File-Disk-Management\find-large-files.cmd"
if "%C%"=="3" call "%~dp0File-Disk-Management\dir-tree.cmd"
if "%C%"=="4" call "%~dp0File-Disk-Management\check-disk.cmd"
if "%C%"=="5" goto menu
goto files

:registry
cls
echo === Registry ===
echo  1. Export Run Keys
echo  2. Query Run Keys
echo  3. Query Uninstall Keys
echo  4. Back
echo.
set /p C=Select:
if "%C%"=="1" call "%~dp0Registry\export-run-keys.cmd"
if "%C%"=="2" call "%~dp0Registry\query-run-keys.cmd"
if "%C%"=="3" call "%~dp0Registry\query-uninstall.cmd"
if "%C%"=="4" goto menu
goto registry

:events
cls
echo === Event Logs ===
echo  1. System Errors
echo  2. Application Errors
echo  3. Clear Logs
echo  4. Back
echo.
set /p C=Select:
if "%C%"=="1" call "%~dp0Event-Logs\system-errors.cmd"
if "%C%"=="2" call "%~dp0Event-Logs\app-errors.cmd"
if "%C%"=="3" call "%~dp0Event-Logs\clear-logs.cmd"
if "%C%"=="4" goto menu
goto events

:tasks
cls
echo === Scheduled Tasks ===
echo  1. List Tasks
echo  2. Task Status
echo  3. Back
echo.
set /p C=Select:
if "%C%"=="1" call "%~dp0Scheduled-Tasks\list-tasks.cmd"
if "%C%"=="2" call "%~dp0Scheduled-Tasks\task-status.cmd"
if "%C%"=="3" goto menu
goto tasks

@echo off
echo === CPU and RAM Summary ===
echo.
echo --- CPU ---
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors,LoadPercentage /format:list
echo --- RAM ---
wmic OS get TotalVisibleMemorySize,FreePhysicalMemory /format:list
pause

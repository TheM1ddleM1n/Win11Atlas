Write-Host "=== CPU Information ==="
Write-Host ""

Get-CimInstance -ClassName Win32_Processor |
    Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, LoadPercentage |
    Format-List

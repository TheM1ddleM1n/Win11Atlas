Write-Host "=== System Health ==="
Write-Host ""

$cpu = Get-CimInstance -ClassName Win32_Processor
Write-Host "CPU: $($cpu.Name)"
Write-Host "CPU Load: $($cpu.LoadPercentage)%"
Write-Host ""

$mem = Get-CimInstance -ClassName Win32_OperatingSystem
$totalMem = [math]::Round($mem.TotalVisibleMemorySize / 1MB, 2)
$freeMem = [math]::Round($mem.FreePhysicalMemory / 1MB, 2)
$usedMem = [math]::Round($totalMem - $freeMem, 2)
Write-Host "RAM Total: ${totalMem} GB"
Write-Host "RAM Used:  ${usedMem} GB"
Write-Host "RAM Free:  ${freeMem} GB"
Write-Host ""

Write-Host "Disk Usage:"
Get-PSDrive -PSProvider FileSystem |
    Select-Object Name,
        @{Name="Used (GB)"; Expression={ [math]::Round($_.Used / 1GB, 2) }},
        @{Name="Free (GB)"; Expression={ [math]::Round($_.Free / 1GB, 2) }} |
    Format-Table -AutoSize

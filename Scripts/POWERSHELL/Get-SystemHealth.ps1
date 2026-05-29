param(
    [switch]$Detailed
)

$cpu = Get-CimInstance -ClassName Win32_Processor
$os = Get-CimInstance -ClassName Win32_OperatingSystem
$totalMem = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$freeMem = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$usedMem = [math]::Round($totalMem - $freeMem, 2)
$memPct = [math]::Round(($usedMem / $totalMem) * 100, 1)

Write-Host "=== System Health Snapshot ==="
Write-Host ""
Write-Host "CPU  : $($cpu.Name)"
Write-Host "Load : $($cpu.LoadPercentage)%"
Write-Host ""
Write-Host "RAM  : ${usedMem} GB used / ${totalMem} GB total (${memPct}%)"
Write-Host ""
Write-Host "=== Disks ==="
Write-Host ""

Get-PSDrive -PSProvider FileSystem |
    Where-Object { $_.Used -and $_.Free } |
    Select-Object Name,
        @{Name="Used (GB)"; Expression={ [math]::Round($_.Used / 1GB, 2) }},
        @{Name="Free (GB)"; Expression={ [math]::Round($_.Free / 1GB, 2) }},
        @{Name="Used %"; Expression={ [math]::Round($_.Used / ($_.Used + $_.Free) * 100, 1) }} |
    Format-Table -AutoSize

if ($Detailed) {
    Write-Host "=== Top 10 Processes by CPU ==="
    Write-Host ""

    Get-Process |
        Sort-Object CPU -Descending |
        Select-Object -First 10 Name, Id, CPU,
            @{Name="RAM (MB)"; Expression={ [math]::Round($_.WorkingSet64 / 1MB, 2) }} |
        Format-Table -AutoSize
}

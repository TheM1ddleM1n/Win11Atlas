Write-Host "=== Memory Usage ==="
Write-Host ""

$os = Get-CimInstance -ClassName Win32_OperatingSystem
$total = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$free = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$used = [math]::Round($total - $free, 2)
$pct = [math]::Round(($used / $total) * 100, 1)

Write-Host "Total : ${total} GB"
Write-Host "Used  : ${used} GB (${pct}%)"
Write-Host "Free  : ${free} GB"
Write-Host ""

Write-Host "=== Top 10 Processes by RAM ==="
Write-Host ""

Get-Process |
    Sort-Object WorkingSet64 -Descending |
    Select-Object -First 10 Name, Id,
        @{Name="RAM (MB)"; Expression={ [math]::Round($_.WorkingSet64 / 1MB, 2) }} |
    Format-Table -AutoSize

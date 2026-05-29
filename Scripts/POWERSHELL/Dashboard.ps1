param(
    [int]$RefreshSeconds = 3
)

function Get-Bar {
    param([double]$Percent, [int]$Width = 30)
    $filled = [math]::Round($Percent / 100 * $Width)
    $empty = $Width - $filled
    return ("[" + ("#" * $filled) + ("-" * $empty) + "]")
}

while ($true) {
    Clear-Host

    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $cpu = Get-CimInstance -ClassName Win32_Processor
    $totalMem = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
    $freeMem = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
    $usedMem = [math]::Round($totalMem - $freeMem, 2)
    $memPct = [math]::Round(($usedMem / $totalMem) * 100, 1)
    $cpuLoad = $cpu.LoadPercentage

    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "  Win11Atlas Dashboard  |  $(Get-Date -Format 'HH:mm:ss')  |  $env:COMPUTERNAME" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""

    $cpuBar = Get-Bar -Percent $cpuLoad
    Write-Host "CPU  $cpuBar $cpuLoad%" -ForegroundColor $(if ($cpuLoad -gt 80) { "Red" } elseif ($cpuLoad -gt 50) { "Yellow" } else { "Green" })

    $memBar = Get-Bar -Percent $memPct
    Write-Host "RAM  $memBar $memPct%  (${usedMem}GB / ${totalMem}GB)" -ForegroundColor $(if ($memPct -gt 80) { "Red" } elseif ($memPct -gt 60) { "Yellow" } else { "Green" })

    Write-Host ""
    Write-Host "--- Disks ---" -ForegroundColor Cyan
    Get-PSDrive -PSProvider FileSystem | ForEach-Object {
        if ($_.Used -and $_.Free) {
            $total = $_.Used + $_.Free
            $pct = [math]::Round($_.Used / $total * 100, 1)
            $bar = Get-Bar -Percent $pct -Width 20
            $usedGB = [math]::Round($_.Used / 1GB, 2)
            $totalGB = [math]::Round($total / 1GB, 2)
            $color = if ($pct -gt 85) { "Red" } elseif ($pct -gt 65) { "Yellow" } else { "Green" }
            Write-Host "  $($_.Name):  $bar $pct%  (${usedGB}GB / ${totalGB}GB)" -ForegroundColor $color
        }
    }

    Write-Host ""
    Write-Host "--- Top 10 Processes by CPU ---" -ForegroundColor Cyan
    Get-Process |
        Sort-Object CPU -Descending |
        Select-Object -First 10 |
        ForEach-Object {
            $ram = [math]::Round($_.WorkingSet64 / 1MB, 2)
            Write-Host ("  {0,-30} PID: {1,-6} CPU: {2,-10} RAM: {3} MB" -f $_.Name, $_.Id, $_.CPU, $ram)
        }

    Write-Host ""
    Write-Host "--- Network Adapters ---" -ForegroundColor Cyan
    Get-NetAdapter | ForEach-Object {
        $color = if ($_.Status -eq "Up") { "Green" } else { "DarkGray" }
        Write-Host "  $($_.Name) - $($_.Status) - $($_.LinkSpeed)" -ForegroundColor $color
    }

    Write-Host ""
    Write-Host "Refreshing every ${RefreshSeconds}s  |  Ctrl+C to exit" -ForegroundColor DarkGray

    Start-Sleep -Seconds $RefreshSeconds
}

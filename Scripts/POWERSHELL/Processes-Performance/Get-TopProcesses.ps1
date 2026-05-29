Write-Host "=== Top 20 Processes by CPU ==="
Write-Host ""

Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 20 Name, Id, CPU,
        @{Name="RAM (MB)"; Expression={ [math]::Round($_.WorkingSet64 / 1MB, 2) }} |
    Format-Table -AutoSize

Write-Host "=== Event Log Sizes ==="
Write-Host ""

Get-WinEvent -ListLog * -ErrorAction SilentlyContinue |
    Where-Object { $_.RecordCount -gt 0 } |
    Select-Object LogName, RecordCount,
        @{Name="Size (MB)"; Expression={ [math]::Round($_.FileSize / 1MB, 2) }},
        IsEnabled |
    Sort-Object "Size (MB)" -Descending |
    Format-Table -AutoSize

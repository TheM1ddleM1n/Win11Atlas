Write-Host "=== Listening Ports ==="
Write-Host ""

Get-NetTCPConnection -State Listen |
    Select-Object LocalAddress, LocalPort, OwningProcess,
        @{Name="ProcessName"; Expression={ (Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).Name }} |
    Sort-Object LocalPort |
    Format-Table -AutoSize

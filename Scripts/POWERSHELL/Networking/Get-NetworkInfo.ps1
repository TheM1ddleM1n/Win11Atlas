Write-Host "=== IP Configuration ==="
Write-Host ""

Get-NetIPAddress |
    Select-Object InterfaceAlias, AddressFamily, IPAddress, PrefixLength |
    Sort-Object InterfaceAlias |
    Format-Table -AutoSize

Write-Host ""
Write-Host "=== Network Adapters ==="
Write-Host ""

Get-NetAdapter |
    Select-Object Name, Status, MacAddress, LinkSpeed |
    Format-Table -AutoSize

Write-Host ""
Write-Host "=== DNS Cache ==="
Write-Host ""

Get-DnsClientCache |
    Select-Object Entry, RecordName, RecordType, Status, DataLength |
    Format-Table -AutoSize

Write-Host ""
Write-Host "=== Listening Ports ==="
Write-Host ""

Get-NetTCPConnection -State Listen |
    Select-Object LocalAddress, LocalPort, OwningProcess,
        @{Name="ProcessName"; Expression={ (Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).Name }} |
    Sort-Object LocalPort |
    Format-Table -AutoSize

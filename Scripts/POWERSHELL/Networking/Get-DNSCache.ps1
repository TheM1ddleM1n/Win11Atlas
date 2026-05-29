Write-Host "=== DNS Cache ==="
Write-Host ""

Get-DnsClientCache |
    Select-Object Entry, RecordName, RecordType, Status, DataLength |
    Format-Table -AutoSize

Write-Host "=== IP Configuration ==="
Write-Host ""

Get-NetIPAddress |
    Select-Object InterfaceAlias, AddressFamily, IPAddress, PrefixLength |
    Sort-Object InterfaceAlias |
    Format-Table -AutoSize

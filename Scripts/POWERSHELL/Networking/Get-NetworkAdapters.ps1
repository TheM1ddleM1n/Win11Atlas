Write-Host "=== Network Adapters ==="
Write-Host ""

Get-NetAdapter |
    Select-Object Name, Status, MacAddress, LinkSpeed |
    Format-Table -AutoSize

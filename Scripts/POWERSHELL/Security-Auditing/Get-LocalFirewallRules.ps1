Write-Host "=== Enabled Firewall Rules ==="
Write-Host ""

Get-NetFirewallRule |
    Where-Object { $_.Enabled -eq "True" } |
    Select-Object DisplayName, Direction, Action, Profile |
    Sort-Object Direction |
    Format-Table -AutoSize

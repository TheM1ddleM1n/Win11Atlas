Write-Host "=== Local Users ==="
Write-Host ""

Get-LocalUser |
    Select-Object Name, Enabled, LastLogon, PasswordRequired, PasswordLastSet |
    Format-Table -AutoSize

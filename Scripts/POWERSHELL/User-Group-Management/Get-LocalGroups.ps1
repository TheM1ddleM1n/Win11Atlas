Write-Host "=== Local Groups ==="
Write-Host ""

Get-LocalGroup |
    Select-Object Name, Description |
    Format-Table -AutoSize

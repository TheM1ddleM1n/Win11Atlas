Write-Host "=== Installed Windows Updates ==="
Write-Host ""

Get-HotFix |
    Select-Object HotFixID, Description, InstalledOn |
    Sort-Object InstalledOn -Descending |
    Format-Table -AutoSize

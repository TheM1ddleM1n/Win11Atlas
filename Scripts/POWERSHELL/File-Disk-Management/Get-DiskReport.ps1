Write-Host "=== Disk Report ==="
Write-Host ""

Get-PSDrive -PSProvider FileSystem |
    Select-Object Name,
        @{Name="Used (GB)"; Expression={ [math]::Round($_.Used / 1GB, 2) }},
        @{Name="Free (GB)"; Expression={ [math]::Round($_.Free / 1GB, 2) }},
        @{Name="Total (GB)"; Expression={ [math]::Round(($_.Used + $_.Free) / 1GB, 2) }},
        @{Name="Used %"; Expression={ [math]::Round(($_.Used / ($_.Used + $_.Free)) * 100, 1) }} |
    Format-Table -AutoSize

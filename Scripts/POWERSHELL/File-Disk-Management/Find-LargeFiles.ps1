param(
    [string]$Path = "C:\",
    [int]$MinSizeMB = 100
)

Write-Host "=== Files Larger Than ${MinSizeMB}MB in $Path ==="
Write-Host ""

Get-ChildItem -Path $Path -Recurse -File -ErrorAction SilentlyContinue |
    Where-Object { $_.Length -gt ($MinSizeMB * 1MB) } |
    Select-Object FullName,
        @{Name="Size (MB)"; Expression={ [math]::Round($_.Length / 1MB, 2) }},
        LastWriteTime |
    Sort-Object "Size (MB)" -Descending |
    Format-Table -AutoSize

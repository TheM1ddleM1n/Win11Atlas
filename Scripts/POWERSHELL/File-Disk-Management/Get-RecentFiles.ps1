param(
    [string]$Path = ".",
    [int]$Days = 7
)

$since = (Get-Date).AddDays(-$Days)

Write-Host "=== Files Modified in Last ${Days} Days in $Path ==="
Write-Host ""

Get-ChildItem -Path $Path -Recurse -File -ErrorAction SilentlyContinue |
    Where-Object { $_.LastWriteTime -gt $since } |
    Select-Object FullName, LastWriteTime,
        @{Name="Size (KB)"; Expression={ [math]::Round($_.Length / 1KB, 2) }} |
    Sort-Object LastWriteTime -Descending |
    Format-Table -AutoSize

param(
    [string]$Path = "."
)

Write-Host "=== Folder Sizes in $Path ==="
Write-Host ""

Get-ChildItem -Path $Path -Directory |
    Select-Object Name,
        @{Name="Size (MB)"; Expression={
            [math]::Round(
                (Get-ChildItem -Path $_.FullName -Recurse -File -ErrorAction SilentlyContinue |
                    Measure-Object -Property Length -Sum).Sum / 1MB, 2)
        }} |
    Sort-Object "Size (MB)" -Descending |
    Format-Table -AutoSize

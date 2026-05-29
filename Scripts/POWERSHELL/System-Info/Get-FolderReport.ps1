param(
    [string]$Path = "."
)

if (-not (Test-Path -Path $Path)) {
    Write-Error "Path not found: $Path"
    exit 1
}

$items = Get-ChildItem -Path $Path -ErrorAction SilentlyContinue

Write-Host "Folder Report for: $(Resolve-Path $Path)"
Write-Host "-------------------------"

$items |
    Select-Object Name,
        @{Name="Size (KB)"; Expression={ if ($_.Length) { [math]::Round($_.Length / 1KB, 2) } else { "-" } }},
        LastWriteTime |
    Format-Table -AutoSize

Write-Host "Total items: $($items.Count)"
Write-Host "Total size (KB): $([math]::Round(($items | Measure-Object -Property Length -Sum).Sum / 1KB, 2))"

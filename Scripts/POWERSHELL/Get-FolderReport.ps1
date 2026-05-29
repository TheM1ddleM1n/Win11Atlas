param(
    [string]$Path = "."
)

Write-Host "Folder Report for: $Path"
Write-Host "-------------------------"

Get-ChildItem -Path $Path |
    Select-Object Name, Length, LastWriteTime |
    Format-Table -AutoSize

param(
    [int]$Count = 50
)

Write-Host "=== Recent Security Events (Last $Count) ==="
Write-Host ""

Get-WinEvent -FilterHashtable @{LogName="Security"} -MaxEvents $Count -ErrorAction SilentlyContinue |
    Select-Object TimeCreated, Id, Message |
    Format-List

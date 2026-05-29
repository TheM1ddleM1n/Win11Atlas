param(
    [int]$Count = 50
)

Write-Host "=== Recent System Errors (Last $Count) ==="
Write-Host ""

Get-WinEvent -FilterHashtable @{LogName="System"; Level=2} -MaxEvents $Count -ErrorAction SilentlyContinue |
    Select-Object TimeCreated, Id, ProviderName, Message |
    Format-List

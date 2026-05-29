param(
    [int]$Count = 50
)

Write-Host "=== Recent Application Errors (Last $Count) ==="
Write-Host ""

Get-WinEvent -FilterHashtable @{LogName="Application"; Level=2} -MaxEvents $Count -ErrorAction SilentlyContinue |
    Select-Object TimeCreated, Id, ProviderName, Message |
    Format-List

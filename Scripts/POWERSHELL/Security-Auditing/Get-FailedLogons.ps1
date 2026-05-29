Write-Host "=== Failed Logon Attempts (Last 50) ==="
Write-Host ""

Get-WinEvent -FilterHashtable @{LogName="Security"; Id=4625} -MaxEvents 50 -ErrorAction SilentlyContinue |
    Select-Object TimeCreated, Message |
    Format-List

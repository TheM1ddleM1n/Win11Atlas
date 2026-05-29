Write-Host "=== Recent Logon Events (Last 30) ==="
Write-Host ""

Get-WinEvent -FilterHashtable @{LogName="Security"; Id=4624} -MaxEvents 30 -ErrorAction SilentlyContinue |
    Select-Object TimeCreated,
        @{Name="User"; Expression={ $_.Properties[5].Value }},
        @{Name="LogonType"; Expression={ $_.Properties[8].Value }},
        @{Name="Source"; Expression={ $_.Properties[18].Value }} |
    Format-Table -AutoSize

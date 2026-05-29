Write-Host "Running Services"
Write-Host "----------------"

Get-Service |
    Where-Object { $_.Status -eq "Running" } |
    Select-Object Name, DisplayName, StartType |
    Sort-Object Name |
    Format-Table -AutoSize

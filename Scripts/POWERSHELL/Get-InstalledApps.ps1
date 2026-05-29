Write-Host "Installed Applications"
Write-Host "----------------------"

Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
    Select-Object DisplayName, DisplayVersion |
    Where-Object { $_.DisplayName } |
    Sort-Object DisplayName

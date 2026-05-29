Write-Host "=== Currently Running Scheduled Tasks ==="
Write-Host ""

Get-ScheduledTask |
    Where-Object { $_.State -eq "Running" } |
    Select-Object TaskName, TaskPath |
    Format-Table -AutoSize

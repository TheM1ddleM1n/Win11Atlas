Write-Host "=== All Scheduled Tasks ==="
Write-Host ""

Get-ScheduledTask |
    Select-Object TaskName, TaskPath, State,
        @{Name="LastRun"; Expression={ ($_ | Get-ScheduledTaskInfo).LastRunTime }},
        @{Name="NextRun"; Expression={ ($_ | Get-ScheduledTaskInfo).NextRunTime }} |
    Sort-Object TaskPath |
    Format-Table -AutoSize

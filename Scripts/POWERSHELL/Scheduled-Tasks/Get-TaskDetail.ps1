param(
    [Parameter(Mandatory=$true)]
    [string]$TaskName
)

$task = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if (-not $task) {
    Write-Error "Task not found: $TaskName"
    exit 1
}

$info = $task | Get-ScheduledTaskInfo

Write-Host "=== Task: $TaskName ==="
Write-Host ""
Write-Host "Path       : $($task.TaskPath)"
Write-Host "State      : $($task.State)"
Write-Host "Last Run   : $($info.LastRunTime)"
Write-Host "Last Result: $($info.LastTaskResult)"
Write-Host "Next Run   : $($info.NextRunTime)"
Write-Host ""
Write-Host "Actions:"
$task.Actions | Format-List
Write-Host "Triggers:"
$task.Triggers | Format-List

param(
    [Parameter(Mandatory=$true)]
    [string]$TaskName
)

$task = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if (-not $task) {
    Write-Error "Task not found: $TaskName"
    exit 1
}

Disable-ScheduledTask -TaskName $TaskName
Write-Host "Disabled: $TaskName"

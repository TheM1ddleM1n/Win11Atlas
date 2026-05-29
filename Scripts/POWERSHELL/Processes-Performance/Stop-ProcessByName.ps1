param(
    [Parameter(Mandatory=$true)]
    [string]$Name
)

$procs = Get-Process -Name $Name -ErrorAction SilentlyContinue

if (-not $procs) {
    Write-Error "No process found with name: $Name"
    exit 1
}

$procs | ForEach-Object {
    Write-Host "Stopping $($_.Name) (PID $($_.Id))"
    Stop-Process -Id $_.Id -Force
}

Write-Host "Done."

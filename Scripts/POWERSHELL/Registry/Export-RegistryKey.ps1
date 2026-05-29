param(
    [Parameter(Mandatory=$true)]
    [string]$KeyPath,
    [string]$OutputFile = "registry-export.reg"
)

if (-not (Test-Path $KeyPath)) {
    Write-Error "Registry key not found: $KeyPath"
    exit 1
}

reg export $KeyPath $OutputFile /y
Write-Host "Exported to $OutputFile"

Write-Host "=== Audit Policy ==="
Write-Host ""

$output = auditpol /get /category:* 2>&1
$output | ForEach-Object { Write-Host $_ }

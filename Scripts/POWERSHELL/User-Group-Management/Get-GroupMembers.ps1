param(
    [string]$Group = "Administrators"
)

Write-Host "=== Members of: $Group ==="
Write-Host ""

Get-LocalGroupMember -Group $Group |
    Select-Object Name, ObjectClass, PrincipalSource |
    Format-Table -AutoSize

$paths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run"
)

Write-Host "=== Registry Run Keys ==="

foreach ($path in $paths) {
    if (Test-Path $path) {
        $scope = switch -Wildcard ($path) {
            "HKLM*Wow6432*" { "HKLM (32-bit)" }
            "HKLM*"         { "HKLM (64-bit)" }
            "HKCU*"         { "HKCU" }
        }
        Write-Host ""
        Write-Host "[$scope]"
        Get-ItemProperty -Path $path |
            Select-Object -Property * -ExcludeProperty PS* |
            Format-List
    }
}

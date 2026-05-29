$paths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
)

Write-Host "Startup Programs"
Write-Host "----------------"

foreach ($path in $paths) {
    if (Test-Path $path) {
        $scope = if ($path -like "HKLM*") { "System" } else { "User" }
        Write-Host ""
        Write-Host "[$scope] $path"
        Get-ItemProperty -Path $path |
            Select-Object -Property * -ExcludeProperty PS* |
            Format-List
    }
}

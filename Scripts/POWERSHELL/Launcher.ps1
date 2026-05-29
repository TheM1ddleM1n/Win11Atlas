$base = Split-Path -Parent $MyInvocation.MyCommand.Path

function Show-Menu {
    param([string]$Title, [string[]]$Options)
    Clear-Host
    Write-Host "=== $Title ==="
    Write-Host ""
    for ($i = 0; $i -lt $Options.Count; $i++) {
        Write-Host "  $($i + 1). $($Options[$i])"
    }
    Write-Host ""
    $choice = Read-Host "Select"
    return $choice
}

function Run-Script {
    param([string]$RelPath)
    $full = Join-Path $base $RelPath
    if (Test-Path $full) {
        & $full
        Read-Host "Press Enter to continue"
    } else {
        Write-Host "Script not found: $full"
        Read-Host "Press Enter to continue"
    }
}

while ($true) {
    $cat = Show-Menu -Title "Win11Atlas PowerShell Launcher" -Options @(
        "Networking",
        "Security and Auditing",
        "User and Group Management",
        "Processes and Performance",
        "File and Disk Management",
        "Registry",
        "Event Logs",
        "Scheduled Tasks",
        "Exit"
    )

    switch ($cat) {
        "1" {
            while ($true) {
                $c = Show-Menu -Title "Networking" -Options @(
                    "Get-NetworkAdapters",
                    "Get-IPConfig",
                    "Get-OpenPorts",
                    "Test-Connectivity",
                    "Get-DNSCache",
                    "Get-RouteTable",
                    "Back"
                )
                if ($c -eq "7") { break }
                $scripts = @("Networking\Get-NetworkAdapters.ps1","Networking\Get-IPConfig.ps1","Networking\Get-OpenPorts.ps1","Networking\Test-Connectivity.ps1","Networking\Get-DNSCache.ps1","Networking\Get-RouteTable.ps1")
                if ($c -ge "1" -and $c -le "6") { Run-Script $scripts[[int]$c - 1] }
            }
        }
        "2" {
            while ($true) {
                $c = Show-Menu -Title "Security and Auditing" -Options @(
                    "Get-LocalFirewallRules",
                    "Get-AuditPolicy",
                    "Get-FailedLogons",
                    "Get-SharedFolders",
                    "Get-InstalledPatches",
                    "Back"
                )
                if ($c -eq "6") { break }
                $scripts = @("Security-Auditing\Get-LocalFirewallRules.ps1","Security-Auditing\Get-AuditPolicy.ps1","Security-Auditing\Get-FailedLogons.ps1","Security-Auditing\Get-SharedFolders.ps1","Security-Auditing\Get-InstalledPatches.ps1")
                if ($c -ge "1" -and $c -le "5") { Run-Script $scripts[[int]$c - 1] }
            }
        }
        "3" {
            while ($true) {
                $c = Show-Menu -Title "User and Group Management" -Options @(
                    "Get-LocalUsers",
                    "Get-LocalGroups",
                    "Get-GroupMembers",
                    "Get-LogonHistory",
                    "Back"
                )
                if ($c -eq "5") { break }
                $scripts = @("User-Group-Management\Get-LocalUsers.ps1","User-Group-Management\Get-LocalGroups.ps1","User-Group-Management\Get-GroupMembers.ps1","User-Group-Management\Get-LogonHistory.ps1")
                if ($c -ge "1" -and $c -le "4") { Run-Script $scripts[[int]$c - 1] }
            }
        }
        "4" {
            while ($true) {
                $c = Show-Menu -Title "Processes and Performance" -Options @(
                    "Get-TopProcesses",
                    "Get-MemoryUsage",
                    "Get-CPUInfo",
                    "Stop-ProcessByName",
                    "Back"
                )
                if ($c -eq "5") { break }
                $scripts = @("Processes-Performance\Get-TopProcesses.ps1","Processes-Performance\Get-MemoryUsage.ps1","Processes-Performance\Get-CPUInfo.ps1","Processes-Performance\Stop-ProcessByName.ps1")
                if ($c -ge "1" -and $c -le "4") { Run-Script $scripts[[int]$c - 1] }
            }
        }
        "5" {
            while ($true) {
                $c = Show-Menu -Title "File and Disk Management" -Options @(
                    "Get-DiskReport",
                    "Find-LargeFiles",
                    "Get-FolderSizes",
                    "Get-RecentFiles",
                    "Back"
                )
                if ($c -eq "5") { break }
                $scripts = @("File-Disk-Management\Get-DiskReport.ps1","File-Disk-Management\Find-LargeFiles.ps1","File-Disk-Management\Get-FolderSizes.ps1","File-Disk-Management\Get-RecentFiles.ps1")
                if ($c -ge "1" -and $c -le "4") { Run-Script $scripts[[int]$c - 1] }
            }
        }
        "6" {
            while ($true) {
                $c = Show-Menu -Title "Registry" -Options @(
                    "Get-RunKeys",
                    "Export-RegistryKey",
                    "Search-Registry",
                    "Back"
                )
                if ($c -eq "4") { break }
                $scripts = @("Registry\Get-RunKeys.ps1","Registry\Export-RegistryKey.ps1","Registry\Search-Registry.ps1")
                if ($c -ge "1" -and $c -le "3") { Run-Script $scripts[[int]$c - 1] }
            }
        }
        "7" {
            while ($true) {
                $c = Show-Menu -Title "Event Logs" -Options @(
                    "Get-SystemErrors",
                    "Get-AppErrors",
                    "Get-SecurityEvents",
                    "Get-EventLogSizes",
                    "Back"
                )
                if ($c -eq "5") { break }
                $scripts = @("Event-Logs\Get-SystemErrors.ps1","Event-Logs\Get-AppErrors.ps1","Event-Logs\Get-SecurityEvents.ps1","Event-Logs\Get-EventLogSizes.ps1")
                if ($c -ge "1" -and $c -le "4") { Run-Script $scripts[[int]$c - 1] }
            }
        }
        "8" {
            while ($true) {
                $c = Show-Menu -Title "Scheduled Tasks" -Options @(
                    "Get-AllTasks",
                    "Get-RunningTasks",
                    "Get-TaskDetail",
                    "Disable-Task",
                    "Back"
                )
                if ($c -eq "5") { break }
                $scripts = @("Scheduled-Tasks\Get-AllTasks.ps1","Scheduled-Tasks\Get-RunningTasks.ps1","Scheduled-Tasks\Get-TaskDetail.ps1","Scheduled-Tasks\Disable-Task.ps1")
                if ($c -ge "1" -and $c -le "4") { Run-Script $scripts[[int]$c - 1] }
            }
        }
        "9" { exit }
    }
}

param(
    [string]$LogName = "Application",
    [ValidateSet("Any", "Critical", "Error", "Warning", "Information")]
    [string]$Level = "Error",
    [int]$Count = 50
)

$levelMap = @{
    Any         = $null
    Critical    = 1
    Error       = 2
    Warning     = 3
    Information = 4
}

$filter = @{ LogName = $LogName }
$levelValue = $levelMap[$Level]
if ($null -ne $levelValue) {
    $filter["Level"] = $levelValue
}

Write-Host "=== $LogName Events | Level: $Level | Last $Count ==="
Write-Host ""

Get-WinEvent -FilterHashtable $filter -MaxEvents $Count -ErrorAction SilentlyContinue |
    Select-Object TimeCreated, Id, ProviderName, Message |
    Format-List

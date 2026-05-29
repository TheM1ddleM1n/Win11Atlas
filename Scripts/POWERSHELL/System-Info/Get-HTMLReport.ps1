$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$hostname = $env:COMPUTERNAME
$user = $env:USERNAME

$os = Get-CimInstance -ClassName Win32_OperatingSystem
$cpu = Get-CimInstance -ClassName Win32_Processor
$totalMem = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$freeMem = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$usedMem = [math]::Round($totalMem - $freeMem, 2)
$memPct = [math]::Round(($usedMem / $totalMem) * 100, 1)

$disks = Get-PSDrive -PSProvider FileSystem |
    Select-Object Name,
        @{Name="Used"; Expression={ [math]::Round($_.Used / 1GB, 2) }},
        @{Name="Free"; Expression={ [math]::Round($_.Free / 1GB, 2) }},
        @{Name="Total"; Expression={ [math]::Round(($_.Used + $_.Free) / 1GB, 2) }}

$topProcs = Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 15 Name, Id, CPU,
        @{Name="RAM_MB"; Expression={ [math]::Round($_.WorkingSet64 / 1MB, 2) }}

$adapters = Get-NetAdapter |
    Select-Object Name, Status, MacAddress, LinkSpeed

$users = Get-LocalUser |
    Select-Object Name, Enabled, LastLogon

function ConvertTo-TableHTML {
    param([object[]]$Data)
    if (-not $Data) { return "<p>No data.</p>" }
    $headers = $Data[0].PSObject.Properties.Name
    $html = "<table><thead><tr>"
    foreach ($h in $headers) { $html += "<th>$h</th>" }
    $html += "</tr></thead><tbody>"
    foreach ($row in $Data) {
        $html += "<tr>"
        foreach ($h in $headers) { $html += "<td>$($row.$h)</td>" }
        $html += "</tr>"
    }
    $html += "</tbody></table>"
    return $html
}

$diskHTML = ConvertTo-TableHTML -Data $disks
$procHTML = ConvertTo-TableHTML -Data $topProcs
$netHTML = ConvertTo-TableHTML -Data $adapters
$userHTML = ConvertTo-TableHTML -Data $users

$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Win11Atlas System Report</title>
<style>
  body { font-family: Segoe UI, sans-serif; background: #0f0f0f; color: #e0e0e0; margin: 0; padding: 2rem; }
  h1 { color: #4fc3f7; border-bottom: 1px solid #333; padding-bottom: 0.5rem; }
  h2 { color: #81d4fa; margin-top: 2rem; }
  .meta { color: #888; font-size: 0.9rem; margin-bottom: 2rem; }
  .card { background: #1a1a1a; border: 1px solid #2a2a2a; border-radius: 6px; padding: 1.5rem; margin-bottom: 1.5rem; }
  .stat { display: inline-block; margin-right: 2rem; }
  .stat .label { font-size: 0.8rem; color: #888; }
  .stat .value { font-size: 1.4rem; font-weight: bold; color: #4fc3f7; }
  table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
  th { background: #222; color: #81d4fa; text-align: left; padding: 0.5rem 0.75rem; font-size: 0.85rem; }
  td { padding: 0.4rem 0.75rem; border-bottom: 1px solid #222; font-size: 0.85rem; }
  tr:hover td { background: #1e1e1e; }
  .bar-container { background: #222; border-radius: 4px; height: 8px; width: 200px; display: inline-block; vertical-align: middle; margin-left: 0.5rem; }
  .bar-fill { background: #4fc3f7; height: 8px; border-radius: 4px; }
</style>
</head>
<body>
<h1>Win11Atlas System Report</h1>
<p class="meta">Host: $hostname &nbsp;|&nbsp; User: $user &nbsp;|&nbsp; Generated: $timestamp</p>

<div class="card">
  <h2>System Overview</h2>
  <div class="stat"><div class="label">OS</div><div class="value">$($os.Caption)</div></div>
  <div class="stat"><div class="label">Build</div><div class="value">$($os.BuildNumber)</div></div>
  <div class="stat"><div class="label">CPU</div><div class="value">$($cpu.Name)</div></div>
  <div class="stat"><div class="label">CPU Load</div><div class="value">$($cpu.LoadPercentage)%</div></div>
</div>

<div class="card">
  <h2>Memory</h2>
  <div class="stat"><div class="label">Total</div><div class="value">${totalMem} GB</div></div>
  <div class="stat"><div class="label">Used</div><div class="value">${usedMem} GB (${memPct}%)</div></div>
  <div class="stat"><div class="label">Free</div><div class="value">${freeMem} GB</div></div>
  <div class="bar-container"><div class="bar-fill" style="width:${memPct}%"></div></div>
</div>

<div class="card">
  <h2>Disk Usage</h2>
  $diskHTML
</div>

<div class="card">
  <h2>Top 15 Processes by CPU</h2>
  $procHTML
</div>

<div class="card">
  <h2>Network Adapters</h2>
  $netHTML
</div>

<div class="card">
  <h2>Local Users</h2>
  $userHTML
</div>
</body>
</html>
"@

$outPath = Join-Path $PSScriptRoot "system-report.html"
$html | Out-File -FilePath $outPath -Encoding UTF8
Write-Host "Report saved to: $outPath"
Start-Process $outPath

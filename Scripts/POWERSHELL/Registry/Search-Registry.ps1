param(
    [Parameter(Mandatory=$true)]
    [string]$SearchTerm,
    [string]$RootPath = "HKLM:\Software"
)

Write-Host "=== Searching Registry for: $SearchTerm ==="
Write-Host ""

Get-ChildItem -Path $RootPath -Recurse -ErrorAction SilentlyContinue |
    ForEach-Object {
        $key = $_
        $key.GetValueNames() | ForEach-Object {
            $val = $key.GetValue($_)
            if ("$val" -like "*$SearchTerm*" -or "$_" -like "*$SearchTerm*") {
                [PSCustomObject]@{
                    KeyPath = $key.PSPath
                    ValueName = $_
                    Data = $val
                }
            }
        }
    } |
    Format-Table -AutoSize

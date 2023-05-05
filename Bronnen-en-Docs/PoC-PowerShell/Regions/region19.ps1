$upnArray = @()
$licenseCounts = @{}

# Get all users from the MgUser command and loop through them
Get-MgUser | ForEach-Object {
    # Add the user principal name to the array
    $upnArray += $_.UserPrincipalName
}

foreach ($upn in $upnArray) {
    $cmd = (Get-MgUserLicenseDetail -UserID $upn)
    $servicePlans = $cmd.ServicePlans
    foreach ($license in $servicePlans.ServicePlanName) {
        if ($licenseCounts.ContainsKey($license)) {
            $licenseCounts[$license]++
        } 
        else {
            $licenseCounts[$license] = 1
        }
    }
}

Write-Host "=== Summary ==="
foreach ($licenseName in $licenseCounts.Keys | Sort-Object) {
    Write-Host "$($licenseName): $($licenseCounts[$licenseName])"
}


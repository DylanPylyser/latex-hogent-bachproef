$upnArray = @()
$licenseCounts = @{}

# Haalt alle gebruikers op en doorloopt de gebruikers één voor één.
# Voegt de User Principal Name toe aan de array.
Get-MgUser | ForEach-Object {
    $upnArray += $_.UserPrincipalName
}

# Doorloopt elke gebruiker uit de array en haalt de licentiedetails op.
# Het slaat dit op in $cmd, $servicePlans slaat de service plans op uit $cmd.
# De service plannen worden opgeteld in een lijst aan de hand van een hash-tabel.
# De tabel houdt het aantal licenties per gebruiker bij en sorteert dit alfabetisch. 
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


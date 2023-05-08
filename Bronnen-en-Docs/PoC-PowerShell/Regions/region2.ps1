# Haalt een lijst van alle gebruikers op die beschikbaar zijn in de Office 365-omgeving.
# Het slaat de UserPrincipalName, OnPremisesSyncEnabled en UserType van elke gebruiker op in de variabele $users.
$users = (Get-MgUser -Select UserPrincipalName,OnPremisesSyncEnabled,UserType)

# Initialiseert de tellers voor de verschillende soorten gebruikers.
$syncedCount = $cloudCount = $memberCount = $guestCount = 0

# Begint een loop waarin elk gebruiker in de $users variabele wordt verwerkt. 
# Voor elke gebruiker wordt de UserPrincipalName getoond en gecontroleerd of het account gesynchroniseerd is,
# met on-premises Active Directory of alleen in de cloud bestaat.
foreach ($user in $users) {
    Write-Host "$($user.UserPrincipalName)`n==="
    if ($user.OnPremisesSyncEnabled) {
      Write-Host "Account Type: Synced`n"
      $syncedCount++
    }
    else {
      Write-Host "Account Type: Cloud"
      $cloudCount++
      if ($($user.UserType) -eq "Guest") {
          Write-Host "User Type: Guest`n"
          $guestCount++
      }
      else {
          Write-Host "User Type: Member`n"
          $memberCount++
      }
    }
}

Write-Host "=== Summary ==="
Write-Host "Cloud: $($cloudCount)`n   Guest: $($GuestCount)`n   Member: $($memberCount)`nSynced: $($syncedCount)"
Write-host "---`nGRAND TOTAL: $($users.count)"
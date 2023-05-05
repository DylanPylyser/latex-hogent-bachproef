$users = (Get-MgUser -Select UserPrincipalName,OnPremisesSyncEnabled,UserType)
$syncedCount = $cloudCount = $memberCount = $guestCount = 0

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

Write-Host "=== Summary ===`nCloud: $($cloudCount)`n   Guest: $($GuestCount)`n   Member: $($memberCount)`nSynced: $($syncedCount)`n---`nGRAND TOTAL: $($users.count)"
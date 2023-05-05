$users = (Get-MgUser -Select UserPrincipalName,AccountEnabled )
$blockedUsersActiveLicenses = $blockedUsers = @()

foreach ($user in $users) {
    if ($user.AccountEnabled -eq $false) { $blockedUsers += $user }
    else { $freeUsers += $user }
}

Write-Host "=== Blocked Users ==="

foreach ($blockedUser in $blockedUsers) {
    if (Get-MgUserLicenseDetail -UserId $blockedUser.UserPrincipalName) { 
        Write-Host "$($blockedUser.UserPrincipalName) - Licenses: ACTIVE"
        $blockedUsersActiveLicenses += $blockedUser
    }
    else { Write-Host "$($blockedUser.UserPrincipalName) - Licenses: NOT ACTIVE" }
}

Write-Host "`nActive License Total: $($blockedUsersActiveLicenses.count)"
Write-Host "---`nGRANT TOTAL: $($blockedUsers.count)"
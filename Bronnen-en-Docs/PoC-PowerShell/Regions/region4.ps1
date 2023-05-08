# Haalt een lijst van alle gebruikers op die beschikbaar zijn in de Office 365-omgeving.
# Het slaat de UserPrincipalName en AccountEnabled van elke gebruiker op in de variabele $users.
$users = (Get-MgUser -Select UserPrincipalName,AccountEnabled)

# Initialiseert de variabelen $blockedUsers en $blockedUsersActiveLicenses als lege arrays.
$blockedUsersActiveLicenses = $blockedUsers = @()

# Doorloopt de lijst met gebruikers in $users.
# Het plaatst geblokkeerde gebruikers in de $blockedUsers array als hun AccountEnabled-waarde "false" is
# (wat betekent dat het account is geblokkeerd).
foreach ($user in $users) {
    if ($user.AccountEnabled -eq $false) { $blockedUsers += $user }
    else { $freeUsers += $user }
}

Write-Host "=== Blocked Users ==="

# Toont informatie over elke geblokkeerde gebruiker en controleert of ze al dan niet actieve licenties hebben.
foreach ($blockedUser in $blockedUsers) {
    if (Get-MgUserLicenseDetail -UserId $blockedUser.UserPrincipalName) { 
        Write-Host "$($blockedUser.UserPrincipalName) - Licenses: ACTIVE"
        $blockedUsersActiveLicenses += $blockedUser
    }
    else { Write-Host "$($blockedUser.UserPrincipalName) - Licenses: NOT ACTIVE" }
}

Write-Host "`nActive Licenses Total: $($blockedUsersActiveLicenses.count)"
Write-Host "---`nGRANT TOTAL: $($blockedUsers.count)"
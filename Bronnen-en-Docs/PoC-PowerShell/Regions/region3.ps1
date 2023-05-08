# Haalt een lijst van alle gebruikers op die beschikbaar zijn in de Office 365-omgeving. 
# Het slaat de UserPrincipalName en AccountEnabled van elke gebruiker op in de variabele $users
$users = (Get-MgUser -Select UserPrincipalName,AccountEnabled)

# Initialiseert de variabelen $blockedUsers en $freeUsers als lege arrays.
$blockedUsers = $freeUsers = @()

# Doorloopt de lijst met gebruikers in $users.
# Het plaatst de gebruikers in de $blockedUsers array als hun AccountEnabled-waarde "true" is (wat betekent dat het account is geblokkeerd).
# Anders plaatst het de gebruikers in de $freeUsers array als hun AccountEnabled-waarde "false" is (wat betekent dat het account niet is geblokkeerd).
foreach ($user in $users) {
    if ($user.AccountEnabled -eq $false) { $blockedUsers += $user }
    else { $freeUsers += $user }
}

Write-Host "=== Account blocked? ==="

# Toont een samenvatting van het aantal geblokkeerde en actieve gebruikersaccounts,
# evenals de gebruikersnamen van elke geblokkeerde en actieve gebruiker.
Write-Host "TRUE: $($blockedUsers.count)"
foreach ($blockedUser in $blockedUsers) {
    Write-Host "   $($blockedUser.UserPrincipalName)"
}
Write-Host "FALSE: $($freeUsers.count)"
foreach ($freeUser in $freeUsers) {
    Write-Host "   $($freeUser.UserPrincipalName)"
}

Write-Host "---`nGRAND TOTAL: $($users.count)"
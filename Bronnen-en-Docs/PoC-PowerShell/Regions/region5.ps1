# Maakt een lege array aan voor de administrators
$adminUsers = @()

# Haalt de lijst van gebruikers op die de rol "Global Administrator" hebben
$admins = (Get-MgDirectoryRole -DirectoryRoleId "e26351ad-20e7-4446-8954-ed9411376217" -ExpandProperty "Members")

# Loopt door alle gebruikers in de "Global Administrator" rol
# Haalt de gebruiker op uit de lijst van gebruikers en voeg de gebruiker toe aan de array van administrateurs
foreach ($adminId in $admins.Members.Id) {
    $adminUsers += (Get-MgUser -UserId $adminId -Select UserPrincipalName,AccountEnabled)
}

# Loopt door de administrateurs en laat hun naam en status van hun account zien
Write-Host "=== Administrators ==="
foreach ($adminUser in $adminUsers) {
    Write-Host "$($adminUser.UserPrincipalName) - Account Enabled: $($adminUser.AccountEnabled)"
}

Write-Host "---`nGRAND TOTAL: $($adminUsers.count)"
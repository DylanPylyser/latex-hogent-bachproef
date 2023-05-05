$adminUsers = @()
$admins = (Get-MgDirectoryRole -DirectoryRoleId "e26351ad-20e7-4446-8954-ed9411376217" -ExpandProperty "Members")

foreach ($adminId in $admins.Members.Id) {
    $adminUsers += (Get-MgUser -UserId $adminId -Select UserPrincipalName,AccountEnabled)
}

Write-Host "=== Administrators ==="
foreach ($adminUser in $adminUsers) {
    Write-Host "$($adminUser.UserPrincipalName) - Account Enabled: $($adminUser.AccountEnabled)"
}

Write-Host "---`nGRAND TOTAL: $($adminUsers.count)"
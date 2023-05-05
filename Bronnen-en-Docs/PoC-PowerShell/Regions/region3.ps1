$users = (Get-MgUser -Select UserPrincipalName,AccountEnabled)
$blockedUsers = $freeUsers = @()

foreach ($user in $users) {
    if ($user.AccountEnabled -eq "$true") { $blockedUsers += $user }
    else { $freeUsers += $user }
}

Write-Host "=== Account blocked? ==="
Write-Host "TRUE: $($blockedUsers.count)"
foreach ($blockedUser in $blockedUsers) {
    Write-Host "   $($blockedUser.UserPrincipalName)"
}
Write-Host "FALSE: $($freeUsers.count)"
foreach ($freeUser in $freeUsers) {
    Write-Host "   $($freeUser.UserPrincipalName)"
}
Write-Host "---`nGRAND TOTAL: $($users.count)"
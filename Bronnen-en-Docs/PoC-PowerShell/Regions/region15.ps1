$users = (Get-MgUser -Select UserPrincipalName, Mail)
$SMTPgroup1Count = $SMTPotherCount = 0
$SMTPmatch1 = "\.onmicrosoft\.com$"
$SMTPgroup1 = $SMTPothers = @()

foreach ($user in $users) {
  if (($user.Mail) -match $SMTPmatch1) {
    $SMTPgroup1 += $user
    $SMTPgroup1Count++
  }
  else {
    $SMTPothers += $user
    $SMTPotherCount++
  }
}

Write-Host "=== Summary ==="
Write-Host "SMTP: .onmicrosoft.com"
foreach ($SMTPgroup1User in $SMTPgroup1) {
    Write-Host "   UPN: $($SMTPgroup1User.UserPrincipalName) - MAIL: $($SMTPgroup1User.Mail)"
}
Write-Host "   ---`n   TOTAL: $($SMTPgroup1.count)`n"
Write-Host "SMTP: Others"
foreach ($SMTPotherUser in $SMTPothers) {
    if ($SMTPotherUser.Mail) { Write-Host "   UPN: $($SMTPotherUser.UserPrincipalName) - MAIL: $($SMTPotherUser.Mail)" }
    else { Write-Host "   UPN: $($SMTPotherUser.UserPrincipalName) - MAIL: Not available"}
}
Write-Host "   ---`n   TOTAL: $($SMTPothers.count)"
Write-host "---`nGRAND TOTAL: $($users.count)"
# Haal de UPN en de e-mailadressen van alle gebruikers op en sla ze op in de variabele $users
$users = (Get-MgUser -Select UserPrincipalName, Mail)   

# Initialiseer de tellers $SMTPgroup1Count en $SMTPotherCount
$SMTPgroup1Count = $SMTPotherCount = 0   

# Definieer de regex die overeenkomt met het gewenste e-maildomein
$SMTPmatch1 = "\.onmicrosoft\.com$" 

# Initialiseer lege arrays voor de twee SMTP-categorieën
$SMTPgroup1 = $SMTPothers = @()   

# Loopt door de lijst van gebruikers en voor elke gebruiker wordt er gecontroleerd of de Mail eigenschap eindigt op ".onmicrosoft.com". 
# Indien ja, voeg de gebruiker toe aan de $SMTPgroup1 array. 
# Indien nee, voeg de gebruiker toe aan de $SMTPothers array.
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

# Toont de gebruikers die behoren tot SMTPgroup1
Write-Host "SMTP: .onmicrosoft.com"
foreach ($SMTPgroup1User in $SMTPgroup1) {   
    Write-Host "   UPN: $($SMTPgroup1User.UserPrincipalName) - MAIL: $($SMTPgroup1User.Mail)"
}
Write-Host "   ---`n   TOTAL: $($SMTPgroup1.count)`n"

# Toont de gebruikers die behoren tot SMTPothers
Write-Host "SMTP: Others"
foreach ($SMTPotherUser in $SMTPothers) {   
    if ($SMTPotherUser.Mail) { Write-Host "   UPN: $($SMTPotherUser.UserPrincipalName) - MAIL: $($SMTPotherUser.Mail)" }
    else { Write-Host "   UPN: $($SMTPotherUser.UserPrincipalName) - MAIL: Not available"}
}
Write-Host "   ---`n   TOTAL: $($SMTPothers.count)"

Write-host "---`nGRAND TOTAL: $($users.count)"
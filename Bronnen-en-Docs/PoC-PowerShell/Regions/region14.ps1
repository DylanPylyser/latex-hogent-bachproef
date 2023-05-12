$mailboxes = @()

# De $users variabele wordt gevuld met gebruikersdata.
$users = (Get-MgUser -Select "Mail")

# De $domains variabele wordt gevuld met domeinen.
$domains = (Get-MgDomain -Select "Id")

# Loopt door elk domein in $domains.
foreach ($domain in $domains) {
    # Maakt een regex-patroon dat overeenkomt met het huidige domein.
    $domainRegex = [regex]::Escape($domain.Id)
    # Loopt door elk gebruikersobject in $users
    foreach ($user in $users) {
        # Controleert of het e-mailadres van de huidige gebruiker overeenkomt met het regex-patroon.
        if ($user.Mail -match "$domainRegex") {
            $mailboxes += $user.Mail
        }
    }
}

Write-Host "=== Summary ==="

# Loopt door elk domein in $domains en elk e-mailadres in de $mailboxes array
foreach ($domain in $domains) {
    Write-Host "Domain: $($domain.id)"
    foreach ($mailbox in $mailboxes) {
        Write-Host "   $($mailbox)"
    }
    Write-Host "   ---`n   Mailboxes: $($mailboxes.count)"
}
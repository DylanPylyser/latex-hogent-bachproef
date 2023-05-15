$licensedUsers = $users = $results = $disabledMFAusers = @()
# Haalt alle gebruikers op in de Microsoft 365-omgeving, selecteert UserPrincipalName en AccountEnabled.
$allUsers = (Get-MgUser -Select UserPrincipalName,AccountEnabled)
# Doorloopt elke gebruiker in $allUsers, en controleert of de gebruiker een licentie heeft voor Microsoft 365.
foreach ($licensedUser in $allUsers) { 
  if (Get-MgUserLicenseDetail -UserId $licensedUser.UserPrincipalName) { $licensedUsers += $licensedUser } }
# Doorloopt elke gebruiker in $licensedUsers, en controleert of de AccountEnabled eigenschap 'True' is.
foreach ($enabledUser in $licensedUsers) { if ($enabledUser.AccountEnabled -eq $True) { $users += $enabledUser } }
# Maakt een nieuw PSCustomObject met de gewenste properties en initialiseert ze als "-" of "_".
foreach ($user in $users) { $resultObject = [PSCustomObject]@{
      user               = "-"
      MFAstatus          = "_"
      email              = "-"
      fido2              = "-"
      app                = "-"
      password           = "-"
      phone              = "-"
      softwareoath       = "-"
      tempaccess         = "-"
      hellobusiness      = "-" }
  # Haalt de MFA-data op van de huidige gebruiker en slaat deze op in $MFAData.
  $MFAData = (Get-MgUserAuthenticationMethod -UserId $user.UserPrincipalName)
  $resultObject.user = $user.UserPrincipalName;
      ForEach ($method in $MFAData) { Switch ($method.AdditionalProperties["@odata.type"]) {
            # Voor elke methode stelt het de overeenkomstige property in op $true en de MFA-status op "Enabled".
            "#microsoft.graph.emailAuthenticationMethod"  {
              $resultObject.email = $true
              $resultObject.MFAstatus = "Enabled"
            }
            "#microsoft.graph.fido2AuthenticationMethod"                   {
              $resultObject.fido2 = $true
              $resultObject.MFAstatus = "Enabled"
            }
            "#microsoft.graph.microsoftAuthenticatorAuthenticationMethod"  {
              $resultObject.app = $true
              $resultObject.MFAstatus = "Enabled"
            }
            "#microsoft.graph.passwordAuthenticationMethod"                {
                  $resultObject.password = $true
                  # Wanneer alleen het wachtwoord is ingesteld, is MFA uitgeschakeld.
                  if ($resultObject.MFAstatus -ne "Enabled") { $resultObject.MFAstatus = "Disabled" }
            }
            "#microsoft.graph.phoneAuthenticationMethod"  {
              $resultObject.phone = $true
              $resultObject.MFAstatus = "Enabled"
            }
              "#microsoft.graph.softwareOathAuthenticationMethod"  {
              $resultObject.softwareoath = $true
              $resultObject.MFAstatus = "Enabled"
            }
              "#microsoft.graph.temporaryAccessPassAuthenticationMethod"  {
              $resultObject.tempaccess = $true
              $resultObject.MFAstatus = "Enabled"
            }
              "#microsoft.graph.windowsHelloForBusinessAuthenticationMethod"  {
              $resultObject.hellobusiness = $true
              $resultObject.MFAstatus = "Enabled"
            } }
  } $results += $resultObject;
}
# loopt door elk object in de $results array en controleert of MFAstatus gelijk is aan "Disabled".
foreach ($disabledMFA in $results) { if ($disabledMFA.MFAstatus -eq "Disabled") { $disabledMFAusers += $disabledMFA } }
$disabledMFAusers
Write-Host "=== Summary ===`nMFA Disabled (Licensed + Account Enabled): $($disabledMFAusers.count)"
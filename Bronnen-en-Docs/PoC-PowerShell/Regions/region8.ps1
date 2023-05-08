$results = $users = @()
# Haalt alle gebruikers op en selecteert hun UserPrincipalName en UserType.
$allUsers = (Get-MgUser -Select UserPrincipalName,UserType)
# Loopt door elke gebruiker en voeg ze toe aan de $users array als ze een "Guest" zijn
foreach ($member in $allUsers) { if ($member.UserType -eq "Guest") { $users += $member } }
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
    hellobusiness      = "-"
  }
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
                if($resultObject.MFAstatus -ne "Enabled") { $resultObject.MFAstatus = "Disabled" }
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
          }
        }
    } $results += $resultObject;
}
# Toont de resultaten van het object.
$results
Write-Host "=== Summary ===`nMFA Disabled (Guest): $($results.count)"
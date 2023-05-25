$results = $users = $MFAdisabled = $MFAenabled = @()
# Haalt alle gebruikers op uit de Microsoft 365-omgeving, selecteert alleen de properties UserPrincipalName en UserType.
$allUsers = (Get-MgUser -Select UserPrincipalName,UserType)
# Loopt door alle gebruikers en voeg alleen de leden toe aan de $users array
foreach ($member in $allUsers) { if ($member.UserType -eq "Member") { $users += $member } }
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
  # Loopt door alle methodes in $MFAData en stelt de bijbehorende properties in voor $resultObject.
  ForEach ($method in $MFAData) { Switch ($method.AdditionalProperties["@odata.type"]) {
          # Voor elke methode stelt het de overeenkomstige property in op $true en de MFA-status op "Enabled".
          "#microsoft.graph.emailAuthenticationMethod"  {
              $resultObject.email = $true
              $resultObject.MFAstatus = "Enabled"
          }
          "#microsoft.graph.fido2AuthenticationMethod"  {
              $resultObject.fido2 = $true
              $resultObject.MFAstatus = "Enabled"
          }
          "#microsoft.graph.microsoftAuthenticatorAuthenticationMethod"  {
              $resultObject.app = $true
              $resultObject.MFAstatus = "Enabled"
          }
          "#microsoft.graph.passwordAuthenticationMethod"  {
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
          }
      }
  } 
  $results += $resultObject;
}
# Loopt door $results en sorteert de resultaatobjecten op basis van hun MFA-status.
foreach ($result in $results) {
  if ($result.MFAstatus -eq "Disabled") { $MFAdisabled += $result } else { $MFAenabled += $result }
}
Write-Host "=== Summary ==="
Write-Host "MFA Disabled (Member): $($MFAdisabled.count) - $([math]::Round((($MFAdisabled.count/$results.count)*100),2))%"
Write-Host "MFA Enabled (Member): $($MFAenabled.count) - $([math]::Round((($MFAenabled.count/$results.count)*100),2))%"
Write-Host "---`nGRANT TOTAL: $($results.count) - 100%"
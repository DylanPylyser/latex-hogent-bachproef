$results=@()
$users = (Get-MgUser -All)
$emailCount = $fido2Count = $appCount = $passwordCount = $phoneCount = 0
$softwareoathCount = $tempaccessCount = $hellobusinessCount = 0
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
             $resultObject.MFAstatus = "Enabled" }
          "#microsoft.graph.fido2AuthenticationMethod"                   {
            $resultObject.fido2 = $true
            $resultObject.MFAstatus = "Enabled" }
          "#microsoft.graph.microsoftAuthenticatorAuthenticationMethod"  {
            $resultObject.app = $true
            $resultObject.MFAstatus = "Enabled" }
          "#microsoft.graph.passwordAuthenticationMethod"                {
                $resultObject.password = $true
                # Wanneer alleen het wachtwoord is ingesteld, is MFA uitgeschakeld.
                if($resultObject.MFAstatus -ne "Enabled") { $resultObject.MFAstatus = "Disabled" } }
          "#microsoft.graph.phoneAuthenticationMethod"  {
            $resultObject.phone = $true
            $resultObject.MFAstatus = "Enabled" }
          "#microsoft.graph.softwareOathAuthenticationMethod"  {
            $resultObject.softwareoath = $true
            $resultObject.MFAstatus = "Enabled" }
          "#microsoft.graph.temporaryAccessPassAuthenticationMethod"  {
            $resultObject.tempaccess = $true
            $resultObject.MFAstatus = "Enabled" }
          "#microsoft.graph.windowsHelloForBusinessAuthenticationMethod"  {
            $resultObject.hellobusiness = $true
            $resultObject.MFAstatus = "Enabled" }
        }
    } $results += $resultObject;
}
# Doorloopt de lijst van gebruikers en telt het aantal gebruikers voor elk type MFA-methode die is ingeschakeld.
ForEach ($MFAusers in $results) { ForEach ($MFAuser in $MFAusers) {
        if ($MFAuser.email -eq "True") { $emailCount++ }
        if ($MFAuser.fido2 -eq "True") { $fido2Count++ }
        if ($MFAuser.app -eq "True") { $appCount++ }
        if ($MFAuser.password -eq "True") { $passwordCount++ }
        if ($MFAuser.phone -eq "True") { $phoneCount++ }
        if ($MFAuser.softwareoath -eq "True") { $softwareoathCount++ }
        if ($MFAuser.tempaccess -eq "True") { $tempaccessCount++ }
        if ($MFAuser.hellobusiness -eq "True") { $hellobusinessCount++ }
} } $results
Write-Host "=== Summary ==="
Write-Host "Email: $($emailCount)`nFIDO2: $($fido2Count)`nApp: $($appCount)"
Write-Host "Password: $($passwordCount)`nPhone: $($phoneCount)`nSoftware OATH: $($softwareoathCount)"
Write-Host "Temporary Access: $($tempaccessCount)`nHello for Business: $($hellobusinessCount)"
$users = $results = $MFAenabled = $MFAdisabled = @()
# Haal de leden van de beheerdersrol op en sla deze op in $admins
$admins = (Get-MgDirectoryRole -DirectoryRoleId "e26351ad-20e7-4446-8954-ed9411376217" -ExpandProperty "Members")
foreach ($adminId in $admins.Members.Id) { $users += (Get-MgUser -Select UserPrincipalName,UserType -UserId $adminId) }
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
                if($resultObject.MFAstatus -ne "Enabled") { $resultObject.MFAstatus = "Disabled" }
          }
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
$results # Toont de resultaten van het object.
Write-Host "=== Summary ==="
foreach ($result in $results) {
    if ($result.MFAstatus -eq "Enabled") { $MFAenabled += $result}
    else { $MFAdisabled += $result} }
Write-Host "MFA Enabled: $($MFAenabled.count)"
foreach ($MFAenabledUser in $MFAenabled) { Write-Host "   $($MFAenabledUser.user)" }
Write-Host "MFA Disabled: $($MFAdisabled.count)"
foreach ($MFAdisabledUser in $MFAdisabled) { Write-Host "   $($MFAdisabledUser.user)" }
Write-Host "---`nGRAND TOTAL: $($results.count)"
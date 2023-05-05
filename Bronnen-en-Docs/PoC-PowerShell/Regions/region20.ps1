$results=@()
$users = Get-MgUser -All
$emailCount = $fido2Count = $appCount = $passwordCount = $phoneCount = $softwareoathCount = $tempaccessCount = $hellobusinessCount = 0

foreach ($user in $users) {

$resultObject = [PSCustomObject]@{
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

$MFAData = Get-MgUserAuthenticationMethod -UserId $user.UserPrincipalName

$resultObject.user = $user.UserPrincipalName;
    ForEach ($method in $MFAData) {

        Switch ($method.AdditionalProperties["@odata.type"]) {
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
                # When only the password is set, then MFA is disabled.
                if($resultObject.MFAstatus -ne "Enabled")
                {
                    $resultObject.MFAstatus = "Disabled"
                }
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

ForEach ($MFAusers in $results) {
    ForEach ($MFAuser in $MFAusers) {
        if ($MFAuser.email -eq "True") { $emailCount++ }
        if ($MFAuser.fido2 -eq "True") { $fido2Count++ }
        if ($MFAuser.app -eq "True") { $appCount++ }
        if ($MFAuser.password -eq "True") { $passwordCount++ }
        if ($MFAuser.phone -eq "True") { $phoneCount++ }
        if ($MFAuser.softwareoath -eq "True") { $softwareoathCount++ }
        if ($MFAuser.tempaccess -eq "True") { $tempaccessCount++ }
        if ($MFAuser.hellobusiness -eq "True") { $hellobusinessCount++ }
    }
}

$results

Write-Host "=== Summary ===`nEmail: $($emailCount)`nFIDO2: $($fido2Count)`nApp: $($appCount)`nPassword: $($passwordCount)`nPhone: $($phoneCount)`nSoftware OATH: $($softwareoathCount)`nTemporary Access: $($tempaccessCount)`nHello for Business: $($hellobusinessCount)"

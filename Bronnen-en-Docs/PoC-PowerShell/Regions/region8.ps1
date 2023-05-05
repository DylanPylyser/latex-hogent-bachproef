$results=@()
$users=@()
$allUsers = (Get-MgUser -Select UserPrincipalName,UserType)

foreach ($member in $allUsers) {
    if ($member.UserType -eq "Guest") { $users += $member }
}

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

##Collecting objects
$results += $resultObject;

}
# Display the custom objects
$results

Write-Host "=== Summary ==="
Write-Host "MFA Disabled (Guest): $($results.count)"
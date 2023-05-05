$users=@()
$results=@()

$admins = (Get-MgDirectoryRole -DirectoryRoleId "e26351ad-20e7-4446-8954-ed9411376217" -ExpandProperty "Members")
$MFAenabled = $MFAdisabled = @()

foreach ($adminId in $admins.Members.Id) {
    $users += (Get-MgUser -Select UserPrincipalName,UserType -UserId $adminId)
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

$results

Write-Host "=== Summary ==="

foreach ($result in $results) {
    if ($result.MFAstatus -eq "Enabled") { $MFAenabled += $result}
    else { $MFAdisabled += $result}
}

Write-Host "MFA Enabled: $($MFAenabled.count)"
foreach ($MFAenabledUser in $MFAenabled) {
    Write-Host "   $($MFAenabledUser.user)"
}

Write-Host "MFA Disabled: $($MFAdisabled.count)"
foreach ($MFAdisabledUser in $MFAdisabled) {
    Write-Host "   $($MFAdisabledUser.user)"
}

Write-Host "---`nGRAND TOTAL: $($results.count)"

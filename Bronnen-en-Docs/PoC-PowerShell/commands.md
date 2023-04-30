# PoC PS-commands

## Voorbereiding

- [x] 1
- [x] 2
- [x] 3
- [x] 4
- [x] 5
- [x] 6
- [x] 7
- [x] 8
- [x] 9
- [ ] 10 (MAIL)
- [ ] 11 (MAIL)
- [ ] 12 (MAIL)
- [ ] 13 (MAIL)
- [ ] 14 (MAIL)
- [x] 15
- [ ] 16 (MAIL)
- [ ] 17 (MAIL)
- [ ] 18 (MAIL)
- [x] 19
- [x] 20

### PowerShell Versie

```powershell
PS D:\HoGent Documenten AJ 22-23\Bachelorproef\latex-hogent-bachproef> $PSVersionTable

Name                           Value
----                           -----
PSVersion                      7.3.4
PSEdition                      Core
GitCommitId                    7.3.4
OS                             Microsoft Windows 10.0.22621
Platform                       Win32NT
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0

PS D:\HoGent Documenten AJ 22-23\Bachelorproef\latex-hogent-bachproef>
```

### Download MS Graph 1.25.0:

`PS D:\HoGent Documenten AJ 22-23\Bachelorproef\latex-hogent-bachproef> Install-Module -Name Microsoft.Graph -RequiredVersion 1.25.0`

### Download MSAL:

`Install-Module MSAL.PS`

### Connect MSGraph

```powershell
# Applicatie-ID van de Azure AD-toepassing.
$AppId = 'c508b8a1-a1cd-4979-a51e-ddbcba517f89'

# ID van de Azure AD-tenant waar de toepassing is geregistreerd.
$TenantId = 'ffa43659-6d7d-4f83-a517-838af35d1353'

# Het clientgeheim voor de toepassing.
$ClientSecret = 'lKI8Q~a7~aZa.2O_xX7b5LMdFEtiqFqNgXntObgP'

# De MSAL PowerShell-module om een toegangstoken te verkrijgen voor de toepassing.
$Token = Get-MsalToken -TenantId $TenantId -ClientId $AppId -ClientSecret ($ClientSecret | ConvertTo-SecureString -AsPlainText -Force)

# Verbinding maken met de Microsoft Graph API via de toegangstoken.
Connect-Graph -AccessToken $Token.AccessToken
```

```powershell
PS D:\HoGent Documenten AJ 22-23\Bachelorproef\latex-hogent-bachproef> Connect-Graph -AccessToken $Token.AccessToken
Welcome To Microsoft Graph!
```

### PoC: logged in (Get-MgUser)

```powershell
PS D:\HoGent Documenten AJ 22-23\Bachelorproef\latex-hogent-bachproef> Get-MgUser
Id                                   DisplayName       Mail                                 UserPrincipalName                    UserType
--                                   -----------       ----                                 -----------------                    --------
12386ad4-188b-41ba-9ac1-16e3963595cc Adele Vance       AdeleV@25ky3d.onmicrosoft.com        AdeleV@25ky3d.onmicrosoft.com
d1368ca6-c61f-4b5b-888c-000850a91f12 Dylan Pylyser     Administrator@25ky3d.onmicrosoft.com Administrator@25ky3d.onmicrosoft.com
89b71ba9-5109-4f18-96c5-f1f5d12597dd Alex Wilber       AlexW@25ky3d.onmicrosoft.com         AlexW@25ky3d.onmicrosoft.com
c3ae0326-6930-48d8-879e-b9a2588a0e05 Diego Siciliani   DiegoS@25ky3d.onmicrosoft.com        DiegoS@25ky3d.onmicrosoft.com
d31ef5ec-b8e2-4241-bc82-5ba8e5953ced Grady Archie      GradyA@25ky3d.onmicrosoft.com        GradyA@25ky3d.onmicrosoft.com
af353063-42ec-41ce-9af4-84e5932b1956 Henrietta Mueller HenriettaM@25ky3d.onmicrosoft.com    HenriettaM@25ky3d.onmicrosoft.com
df65c8f2-7965-46f9-9d97-e29035965280 Isaiah Langer     IsaiahL@25ky3d.onmicrosoft.com       IsaiahL@25ky3d.onmicrosoft.com
c663b4df-2153-4a7f-b641-2dda41d4087c Johanna Lorenz    JohannaL@25ky3d.onmicrosoft.com      JohannaL@25ky3d.onmicrosoft.com
534148fa-feb7-4a91-9937-3d2d7f79be9a Joni Sherman      JoniS@25ky3d.onmicrosoft.com         JoniS@25ky3d.onmicrosoft.com
f7508b56-be5a-436a-8c52-bff5c1222200 Lee Gu            LeeG@25ky3d.onmicrosoft.com          LeeG@25ky3d.onmicrosoft.com
ff549021-dbb4-436b-8706-cd1fb89dfa08 Lidia Holloway    LidiaH@25ky3d.onmicrosoft.com        LidiaH@25ky3d.onmicrosoft.com
72558a84-d77c-4a70-996c-cf1e8e85e84e Lynne Robbins     LynneR@25ky3d.onmicrosoft.com        LynneR@25ky3d.onmicrosoft.com
7410701d-de65-44f3-9004-97ba5b2d0a1a Megan Bowen       MeganB@25ky3d.onmicrosoft.com        MeganB@25ky3d.onmicrosoft.com
91fd0046-a237-433c-ad83-7b84f26c0b25 Miriam Graham     MiriamG@25ky3d.onmicrosoft.com       MiriamG@25ky3d.onmicrosoft.com
4c31a227-b284-4a97-b13a-4a0c32870552 Nestor Wilke      NestorW@25ky3d.onmicrosoft.com       NestorW@25ky3d.onmicrosoft.com
40f70424-1c2a-45b7-841e-7c68568a4e62 Jarne Creten                                           o_jcre@25ky3d.onmicrosoft.com
ff5666f6-60d0-45b9-8dc5-bb929203efc0 Patti Fernandez   PattiF@25ky3d.onmicrosoft.com        PattiF@25ky3d.onmicrosoft.com
ea3d8841-88e3-4cf8-b541-2b14f89a9853 Pradeep Gupta     PradeepG@25ky3d.onmicrosoft.com      PradeepG@25ky3d.onmicrosoft.com
```

#### Audit data

```powershell
# Nodig:
    #domain,
Get-MgDomain
    #userprincipalname,
Get-MgUser -Select "UserPrincipalName"
    #displayname,
Get-MgUser -Select "DisplayName"
    #usagelocation,
///
    #cloudtype,

    #IsAdmin,
    #Roles,
    #isMFA,
    #MfaEnabled,
    #MfaMethods,
    #NumberOfMfaMethods,
    #MfaDefaultMethod,
    #MfaMethodsConfigured,
    #MfaPhone,
    #MfaEmail,
    #lastdirsynctime,
    #LastPasswordChangeTimestamp,
    #LastLogonTime,
    #Blockcredential,
    #AccountDisabled,
    #islicensed,
    #Licenses,
    #ServiceName,
    #ProvisioningStatus,
    #recipienttypedetails,
    #MailboxSize,
    #TotalItems,
    #FolderCount,
    #ArchiveStatus,
    #Archive,
    #ArchiveSize,
    #RetentionPolicy,
    #PrimarySMTP,
    #PrimarySMTPDomain,
    #EmailAliases,
    #DeliverToMailboxAndForward,
    #ForwardingSMTPAddress,
    #Hidden,
    #UserType,
Get-MgUser -Select "UserType"
    #domains

```

#### MFA Data - SCRIPT

Source: https://activedirectorypro.com/mfa-status-powershell/

```powershell
$results=@()
$users = Get-MgUser -All

foreach ($user in $users) {

Write-Host  "`n$($user.UserPrincipalName)";
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
```

#### Pivot 1 (STATUS: Check!)

**Azure AD Graph**

```powershell
#PIVOT 1: Domains: Template 3.1
$domains = (get-msoldomain)
# Define the table Columns
$TableDomains  = New-Object system.Data.DataTable 'Overview_domains'
$newcol = New-Object system.Data.DataColumn Name,([string]);  $TableDomains.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn Status,([string]);  $TableDomains.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn Authentication,([string]);  $TableDomains.columns.add($newcol)

 # Add a table row

Foreach ($i in $domains){
 $row                = $TableDomains.NewRow()
 $row.Name           = $i.Name
 $row.Status         = $i.Status
 $row.Authentication = $i.Authentication
 $TableDomains.Rows.Add($row)
}
 # Get the data out
$TableDomains | Export-Csv -path '.\domainOverview.csv' -NoTypeInformation
Import-Csv '.\domainOverview.csv' | Export-Excel $fileNameExcelOutput -Autosize -TableName $TableDomains.TableName -WorksheetName 'Domains'
```

**MS Graph**

```powershell
Get-MgDomain
```

#### Pivot 2 (STATUS: Check!)

**Azure AD Graph**

```powershell
[Int]$totalsynced= ($auditdata | Where-Object {$_.CloudType -eq 'synced'}).count
[Int]$totalguest = ($auditdata | Where-Object {($_.UserType  -eq 'guest')}).count
[Int]$totalmember= ($auditdata | Where-Object {($_.CloudType -eq 'cloud') -and ($_.UserType  -eq 'member')}).count
[Int]$totalcloud = [Int]$totalmember + [Int]$totalguest
[Int]$total      = [Int]$totalcloud + [Int]$totalsynced

# Define the DataAccounts Columns
$TableAccounts = New-Object system.Data.DataTable 'Overview_TableAccounts'
$newcol = New-Object system.Data.DataColumn Account_Type,([string]); $TableAccounts.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn Total,([int]); $TableAccounts.columns.add($newcol)

# Add a DataAccounts row

$rowCloud = $TableAccounts.NewRow()
$rowCloud.Account_Type= ("Cloud")
$rowCloud.Total= $totalcloud
$TableAccounts.Rows.Add($rowCloud)

$rowGuest = $TableAccounts.NewRow()
$rowGuest.Account_Type= ("   Guest")
$rowGuest.Total= $totalguest
$TableAccounts.Rows.Add($rowGuest)

$rowMember = $TableAccounts.NewRow()
$rowMember.Account_Type= ("   Member")
$rowMember.Total= $totalmember
$TableAccounts.Rows.Add($rowMember)

$rowSynced = $TableAccounts.NewRow()
$rowSynced.Account_Type= ("Synced")
$rowSynced.Total= $totalsynced
$TableAccounts.Rows.Add($rowSynced)

$rowTotal = $TableAccounts.NewRow()
$rowTotal.Account_Type= ("Total")
$rowTotal.Total= $total
$TableAccounts.Rows.Add($rowTotal)

# Get the data out
$TableAccounts | Export-Csv -path '.\AccountsOverview.csv' -NoTypeInformation
Import-Csv '.\AccountsOverview.csv' | Export-Excel $fileNameExcelOutput -Autosize -TableName $TableAccounts.TableName  -WorksheetName 'AccountsOverview'
```

**MS Graph**

```ps1
Get-MgUser -Select "UserType"
Get-MgUser | Format-List -Property "OnPremisesSyncEnabled"
```

#### Pivot 3 (Status: Check!)

**Azure AD Graph**

```powershell
#PIVOT 3 : Template 3.3.2.1

[Int]$countFalse = ($auditdata | Where-Object {($_.UserType -eq 'Member') -and ($_.BlockCredential -eq $false)}).count
[Int]$countTrue  = ($auditdata | Where-Object {($_.UserType -eq 'Member') -and ($_.BlockCredential -eq $true)}).count
[Int]$grandTotal = [int]$countFalse + [int]$countTrue


# Define the Table and Columns
$BlockedAccounts = New-Object system.Data.DataTable 'Overview_BlockedAccounts'
$newcol = New-Object system.Data.DataColumn Account_Blocked,([string]); $BlockedAccounts.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn Items,([int]); $BlockedAccounts.columns.add($newcol)

# Add the Table Rows

$rowTrue = $BlockedAccounts.NewRow()
$rowTrue.Account_Blocked= ("Active")
$rowTrue.Items= $countFalse
$BlockedAccounts.Rows.Add($rowTrue)

$rowFalse = $BlockedAccounts.NewRow()
$rowFalse.Account_Blocked= ("Blocked")
$rowFalse.Items= $countTrue
$BlockedAccounts.Rows.Add($rowFalse)

$rowTotal = $BlockedAccounts.NewRow()
$rowTotal.Account_Blocked= ("Grand Total")
$rowTotal.Items= $grandTotal
$BlockedAccounts.Rows.Add($rowTotal)

# Get the data out
$BlockedAccounts | Export-Csv -path '.\BlockedAccounts.csv' -NoTypeInformation
Import-Csv '.\BlockedAccounts.csv' | Export-Excel $fileNameExcelOutput -Autosize -TableName $BlockedAccounts.TableName -WorksheetName 'BlockedAccounts'
```

**MS Graph**

```ps1
Get-MgUser -Select AccountEnabled,DisplayName | Format-List -Property "AccountEnabled", "DisplayName"
```

#### Pivot 4 (Status: TO DO!)

**Azure AD Graph**

```powershell
#PIVOT 4: Licensed, Blocked accounts: Template 3.3.2.3

$blockedLicensed = ($auditdata | Where-Object {($_.BlockCredential -eq $true) -and ($_.IsLicensed -eq $true)})
$count = 0

# Define the DataAccounts Columns
 $TableBlockedLicensed = New-Object system.Data.DataTable 'Overview_Licensed_Blocked_accounts'
 $newcol = New-Object system.Data.DataColumn UserPrincipalName,([string]); $TableBlockedLicensed.columns.add($newcol)
 $newcol = New-Object system.Data.DataColumn DisplayName,([string]); $TableBlockedLicensed.columns.add($newcol)

 # Add a DataAccounts row
foreach($i in $blockedLicensed){
    $row                     = $TableBlockedLicensed.NewRow()
    $row.UserPrincipalName   = $i.userprincipalname
    $row.DisplayName         = $i.displayname
    $TableBlockedLicensed.Rows.Add($row)
    $count ++
}
$row = $TableBlockedLicensed.NewRow()
$row.UserPrincipalName = "Count"
$row.DisplayName = $count
$TableBlockedLicensed.Rows.Add($row)

# Get the data out
$TableBlockedLicensed | Export-Csv -path '.\BlockedLicensedAccounts.csv' -NoTypeInformation
Import-Csv '.\BlockedLicensedAccounts.csv' | Export-Excel $fileNameExcelOutput -Autosize -TableName $TableBlockedlicensed.TableName -WorksheetName 'BlockedLicensedAccounts'
```

**MS Graph**

```powershell
# user = guest
# user => licenties actief?

$users = (Get-MgUser -Select UserPrincipalName,UserType)
$guests=@()

foreach ($guest in $users) {
    if ($guest.UserType -eq "Guest") { $guests += $guest }
}

foreach ($guestUser in $guests) {
    if (Get-MgUserLicenseDetail -UserId $guestUser.UserPrincipalName) { Write-Host "$($guestUser.UserPrincipalName) is Licensed" }
    else { Write-Host Write-Host "$($guestUser.UserPrincipalName) is not licensed" }
}
```

#### Pivot 5 (STATUS: CHECK!)

**Azure AD Graph**

```powershell
$adminAccounts = ($auditdata | Where-Object {$_.Roles})

# Define the DataAccounts Columns
 $TableAdminAccounts = New-Object system.Data.DataTable 'Overview_Admin_Accounts'
 $newcol = New-Object system.Data.DataColumn DisplayName,([string]); $TableAdminAccounts.columns.add($newcol)
 $newcol = New-Object system.Data.DataColumn UserPrincipalName,([string]); $TableAdminAccounts.columns.add($newcol)
 $newcol = New-Object system.Data.DataColumn SigninStatus,([string]); $TableAdminAccounts.columns.add($newcol)
 $newcol = New-Object system.Data.DataColumn AdminRoles,([string]); $TableAdminAccounts.columns.add($newcol)

 # Add a DataAccounts row
foreach($i in $adminAccounts){
    if($i.DisplayName -notlike '*Synchronization*'){
        $row                     = $TableAdminAccounts.NewRow()
        $row.DisplayName         = $i.displayname
        $row.UserPrincipalName   = $i.userprincipalname
        if($i.BlockCredential -eq $true){
            $row.SigninStatus    = "Disabled"
        }else{
            $row.SigninStatus    = "Enabled"
        }
        $row.AdminRoles         = $i.Roles
        $TableAdminAccounts.Rows.Add($row)
    }
} -join ', '
 # Get the data out
 $TableAdminAccounts | Export-Csv -path '.\adminAccounts.csv' -NoTypeInformation
 Import-Csv '.\adminAccounts.csv' | Export-Excel $fileNameExcelOutput -Autosize -TableName $TableAdminAccounts.TableName -WorksheetName 'AdminAccounts'
```

**MS Graph**

```powershell
# Global Administrators: e26351ad-20e7-4446-8954-ed9411376217
# Get-MgDirectoryRole -DirectoryRoleId "e26351ad-20e7-4446-8954-ed9411376217" -ExpandProperty "Members" | Format-List -Property "Members"
$admins=@()

$admins = (Get-MgDirectoryRole -DirectoryRoleId "e26351ad-20e7-4446-8954-ed9411376217" -ExpandProperty "Members")

foreach ($adminId in $admins.Members.Id) {
    Get-MgUser -UserId $adminId
}

```

#### Pivot 6 (STATUS: CHECK)

**Azure AD Graph**

```powershell

[Int]$countMFAEnabled  = ($auditdata | Where-Object  {($_.usertype -eq "Member") -and ($_.MfaEnabled -eq "Enabled")   -and ($_.RecipientTypeDetails -eq "UserMailbox" -or $null)}).count
[Int]$countMFAEnforced = ($auditdata | Where-Object  {($_.usertype -eq "Member") -and ($_.MfaEnabled -eq "Enforced")  -and ($_.RecipientTypeDetails -eq "UserMailbox" -or $null)}).count
[Int]$countMFADisabled = ($auditdata | Where-Object  {($_.usertype -eq "Member") -and ($_.MfaEnabled -eq "Disabled")  -and ($_.RecipientTypeDetails -eq "UserMailbox" -or $null)}).count
[Int]$totalCountMFA    = [Int]$countMFAEnabled + [Int]$countMFAEnforced + [Int]$countMFADisabled


# Define the Table and Columns
$MfaCountTable = New-Object system.Data.DataTable 'Overview_MFA_Count'
$newcol = New-Object system.Data.DataColumn Active_Accounts,([string]); $MfaCountTable.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn Count,([int]); $MfaCountTable.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn Percentage,([int]); $MfaCountTable.columns.add($newcol)

 # Add the Table Rows

$rowMFADisabled = $MfaCountTable.NewRow()
$rowMFADisabled.Active_Accounts= ("MFA is Disabled")
$rowMFADisabled.Count= $countMFADisabled
$rowMFADisabled.Percentage= (($countMFADisabled/$totalCountMFA)*100)
$MfaCountTable.Rows.Add($rowMFADisabled)

$rowMFAEnabled = $MfaCountTable.NewRow()
$rowMFAEnabled.Active_Accounts= ("MFA is Enabled")
$rowMFAEnabled.Count= $countMFAEnabled
$rowMFAEnabled.Percentage= (($countMFAEnabled/$totalCountMFA)*100)
$MfaCountTable.Rows.Add($rowMFAEnabled)

$rowMFAEnforced = $MfaCountTable.NewRow()
$rowMFAEnforced.Active_Accounts= ("MFA is Enforced")
$rowMFAEnforced.Count= $countMFAEnforced
$rowMFAEnforced.Percentage= (($countMFAEnforced/$totalCountMFA)*100)
$MfaCountTable.Rows.Add($rowMFAEnforced)

$rowMFATotal = $MfaCountTable.NewRow()
$rowMFATotal.Active_Accounts= ("Total")
$rowMFATotal.Count= $totalCountMFA
$rowMFATotal.Percentage = 100
$MfaCountTable.Rows.Add($rowMFATotal)

# Get the data out
$MfaCountTable | Export-Csv -path '.\MfaOverview.csv' -NoTypeInformation
Import-Csv '.\MfaOverview.csv' | Export-Excel $fileNameExcelOutput -Autosize -TableName $MfaCountTable.TableName -WorksheetName 'MfaOverview'



#Multifactor Authentication : Template 3.3.4

[Int]$countOneWaySMS          = 0
[Int]$countTwoWayVoiceMobile  = 0
[Int]$countPhoneAppOTP        = 0
[Int]$countPhoneAppNotif      = 0
[Int]$countNoMfaMethod        = 0

# Define the Table and Columns
$MfaMethodsTable = New-Object system.Data.DataTable 'OverviewMfaMethodsUsed'
$newcol = New-Object system.Data.DataColumn Active_Method,([string]); $MfaMethodsTable.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn Count,([int]); $MfaMethodsTable.columns.add($newcol)

 # Add the Table Rows

foreach ($i in $auditdata){
    if ($i.mfamethods -like "*OneWaySMS*") {
        $countOneWaySMS++
    }
    if ($i.mfamethods -like "*TwoWayVoiceMobile*"){
        $countTwoWayVoiceMobile++
    }
    if ($i.mfamethods -like "*PhoneAppOTP*"){
        $countPhoneAppOTP++
    }
    if ($i.mfamethods -like "*PhoneAppNotification*"){
        $countPhoneAppNotif++
    }
    if (($i.numberOfMfaMethods -like "*0*") -or ($i.MfaMethodsConfigured -like "*0*")){
        $countNoMfaMethod++
    }
}

$rowOneWaySMS = $MfaMethodsTable.NewRow()
$rowOneWaySMS.Active_Method= ("OneWaySMS")
$rowOneWaySMS.Count= $countOneWaySMS
$MfaMethodsTable.Rows.Add($rowOneWaySMS)

$rowPhoneAppNotification = $MfaMethodsTable.NewRow()
$rowPhoneAppNotification.Active_Method= ("PhoneAppNotification")
$rowPhoneAppNotification.Count=$countPhoneAppNotif
$MfaMethodsTable.Rows.Add($rowPhoneAppNotification)

$rowTwoWayVoice = $MfaMethodsTable.NewRow()
$rowTwoWayVoice.Active_Method= ("TwoWayVoiceAlternateMobile")
$rowTwoWayVoice.Count= $countTwoWayVoiceMobile
$MfaMethodsTable.Rows.Add($rowTwoWayVoice)

$rowPhoneAppOTP = $MfaMethodsTable.NewRow()
$rowPhoneAppOTP.Active_Method= ("phoneAppOTP")
$rowPhoneAppOTP.Count= $countPhoneAppOTP
$MfaMethodsTable.Rows.Add($rowPhoneAppOTP)

$rowNoMfa = $MfaMethodsTable.NewRow()
$rowNoMfa.Active_Method= ("no Mfa Method")
$rowNoMfa.Count= $countNoMfaMethod
$MfaMethodsTable.Rows.Add($rowNoMfa)

# Get the data out
$MfaMethodsTable | Export-Csv -path '.\OverviewMfaMethodsUsed.csv' -NoTypeInformation
Import-Csv '.\OverviewMfaMethodsUsed.csv' | Export-Excel $fileNameExcelOutput -Autosize -TableName $MfaMethodsTable.TableName -WorksheetName 'OverviewMfaMethodsUsed'
```

**MS Graph**

```powershell
$results=@()
$users=@()
$allUsers = (Get-MgUser -Select UserPrincipalName,UserType)

foreach ($member in $allUsers) {
    if ($member.UserType -eq "Member") { $users += $member }
}

foreach ($user in $users) {

Write-Host  "`n$($user.UserPrincipalName)";
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
```

#### Pivot 7 (STATUS: CHECK!)

**MS Graph**

```powershell
# Alle gelicenseerde = Op licentie filteren
# Actieve accounts => Account = member
# Met MFA = false => Filteren op MFAstatus = Disabled

$allUsers = (Get-MgUser -Select UserPrincipalName,UserType)
$licensedUsers=@()
$users=@()
$results=@()
$disabledMFAusers=@()

foreach ($licensedUser in $allUsers) {
    if (Get-MgUserLicenseDetail -UserId $licensedUser.UserPrincipalName) { $licensedUsers += $licensedUser }
}

foreach ($member in $licensedUsers) {
    if ($member.UserType -eq "Member") { $users += $member }
}

foreach ($user in $users) {

Write-Host  "`n$($user.UserPrincipalName)";
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

foreach ($disabledMFA in $results) {
    if ($disabledMFA.MFAstatus -eq "Disabled") { $disabledMFAusers += $disabledMFA }
}

$disabledMFAusers
```

#### Pivot 8 (STATUS: CHECK)

**MS Graph**

```powershell
$results=@()
$users=@()
$allUsers = (Get-MgUser -Select UserPrincipalName,UserType)

foreach ($member in $allUsers) {
    if ($member.UserType -eq "Guest") { $users += $member }
}

foreach ($user in $users) {

Write-Host  "`n$($user.UserPrincipalName)";
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
```

#### Pivot 9 (STATUS: TODO!)

**MS Graph**

```powershell
$users=@()
$results=@()

$admins = (Get-MgDirectoryRole -DirectoryRoleId "e26351ad-20e7-4446-8954-ed9411376217" -ExpandProperty "Members")

foreach ($adminId in $admins.Members.Id) {
    $users += (Get-MgUser -Select UserPrincipalName,UserType -UserId $adminId)
}

foreach ($user in $users) {

Write-Host  "`n$($user.UserPrincipalName)";
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
```

#### Pivot 10 (STATUS: TODO!)

**Azure AD Graph**

```powershell
#PIVOT 10 Mailboxes Overview

[Int]$EquipmentMailboxCount  = 0
[uint64]$EquipmentMailboxSize   = 0
[Int]$RoomMailboxCount       = 0
[uint64]$RoomMailboxSize        = 0
[Int]$SchedulingMailboxCount = 0
[uint64]$SchedulingMailboxSize  = 0
[Int]$SharedMailboxCount     = 0
[uint64]$SharedMailboxSize      = 0
[Int]$UserMailboxCount       = 0
[uint64]$UserMailboxSize        = 0

foreach ($i in $auditdata) {
    if($i.RecipientTypeDetails -like "*EquipmentMailbox*"){
        $EquipmentMailboxCount ++
        $EquipmentMailboxSize += [convert]::ToUInt64($i.mailboxsize)
    }elseif ($i.RecipientTypeDetails -like "*RoomMailbox*") {
        $RoomMailboxCount ++
        $RoomMailboxSize += [convert]::ToUInt64($i.mailboxsize)
    }elseif ($i.RecipientTypeDetails -like "*SchedulingMailbox*"){
        $SchedulingMailboxCount ++
        $SchedulingMailboxSize += [convert]::ToUInt64($i.mailboxsize)
    }elseif ($i.RecipientTypeDetails -like "*SharedMailbox*"){
        $SharedMailboxCount ++
        $SharedMailboxSize += [convert]::ToUInt64($i.mailboxsize)
    }elseif($i.RecipientTypeDetails -like "*UserMailbox*"){
        $UserMailboxCount ++
        $UserMailboxSize += [convert]::ToUInt64($i.mailboxsize)
    }else{
        Write-Host 'User has no mailbox'
    }
}

# Define the Table and Columns

$MailboxOverviewTable = New-Object system.Data.DataTable 'MailboxOverview'
$newcol = New-Object system.Data.DataColumn Mailbox_Type,([string]); $MailboxOverviewTable.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn NumberOfMailboxes,([Int]);  $MailboxOverviewTable.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn TotalMailboxSizeInMB,([Int]);  $MailboxOverviewTable.columns.add($newcol)

# Add the Table Rows
[double]$EquipmentMailboxSizeInMB = [math]::Round($EquipmentMailboxSize / 1MB, 4)
[double]$RoomMailboxSizeInMB      = [math]::Round($RoomMailboxSize / 1MB, 3)
[double]$SchedulingMailboxSizeInMB= [math]::Round($SchedulingMailboxSize / 1MB, 4)
[double]$SharedMailboxSizeInMB    = [math]::Round($SharedMailboxSize / 1MB, 4)
[double]$UserMailboxSizeInMB      = [math]::Round($UserMailboxSize / 1MB, 4)
#[double]$totalMailboxSizeInGB     = [math]::Round($totalMailboxSizeInMB / 1GB, 3) Currently not used

[double]$totalMailboxSizeInMB     = $EquipmentMailboxSizeInMB + $RoomMailboxSizeInMB + $SchedulingMailboxSizeInMB + $SharedMailboxSizeInMB + $UserMailboxSizeInMB

$TotalNumberOfMailboxes = $EquipmentMailboxCount + $RoomMailboxCount + $SchedulingMailboxCount + $SharedMailboxCount + $UserMailboxCount

$row = $MailboxOverviewTable.NewRow()
$row.Mailbox_Type= ("EquipmentMailbox")
$row.NumberOfMailboxes= $EquipmentMailboxCount
$row.TotalMailboxSizeInMB=  $EquipmentMailboxSizeInMB
$MailboxOverviewTable.Rows.Add($row)

$row = $MailboxOverviewTable.NewRow()
$row.Mailbox_Type= ("RoomMailbox")
$row.NumberOfMailboxes= $RoomMailboxCount
$row.TotalMailboxSizeInMB= $RoomMailboxSizeInMB
$MailboxOverviewTable.Rows.Add($row)

$row = $MailboxOverviewTable.NewRow()
$row.Mailbox_Type= ("SchedulingMailbox")
$row.NumberOfMailboxes= $SchedulingMailboxCount
$row.TotalMailboxSizeInMB= $SchedulingMailboxSizeInMB
$MailboxOverviewTable.Rows.Add($row)

$row = $MailboxOverviewTable.NewRow()
$row.Mailbox_Type= ("SharedMailbox")
$row.NumberOfMailboxes= $SharedMailboxCount
$row.TotalMailboxSizeInMB= $SharedMailboxSizeInMB
$MailboxOverviewTable.Rows.Add($row)

$row = $MailboxOverviewTable.NewRow()
$row.Mailbox_Type= ("UserMailbox")
$row.NumberOfMailboxes= $UserMailboxCount
$row.TotalMailboxSizeInMB= $UserMailboxSizeInMB
$MailboxOverviewTable.Rows.Add($row)

$row = $MailboxOverviewTable.NewRow()
$row.Mailbox_Type= ("Grand Total")
$row.NumberOfMailboxes=$TotalNumberOfMailboxes
$row.TotalMailboxSizeInMB=$totalMailboxSizeInMB
$MailboxOverviewTable.Rows.Add($row)

# Get the data out
$MailboxOverviewTable | Export-Csv -path '.\MailboxOverview.csv' -NoTypeInformation
Import-Csv '.\MailboxOverview.csv' | Export-Excel $fileNameExcelOutput -Autosize -TableName $MailboxOverviewTable.TableName -WorksheetName 'MailboxOverview'

#TableUserMailboxSize

$UserMailboxes = ($auditdata | Where-Object {($_.RecipientTypeDetails -like "*UserMailbox*")})

# Define the Table and Columns

$MailboxSizeOverviewTable = New-Object system.Data.DataTable 'MailboxSizeOverview'
$newcol = New-Object system.Data.DataColumn Mailbox_size,([string]); $MailboxSizeOverviewTable.columns.add($newcol)
$newcol = New-Object system.Data.DataColumn NumberOfMailboxes,([Int]);  $MailboxSizeOverviewTable.columns.add($newcol)

# Add the Table Rows

$Size0to4GB       = ($UserMailboxes | Where-Object {([convert]::ToInt64($_.mailboxsize) -lt 499999999)})
$Size4to10GB      = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 499999999)   -and (([uint64]($_.mailboxsize) -lt 9999999999)))})
$Size10to20GB     = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 9999999999)  -and (([convert]::ToUInt64($_.mailboxsize) -lt 19999999999)))})
$Size20to30GB     = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 19999999999) -and (([convert]::ToUInt64($_.mailboxsize) -lt 29999999999)))})
$Size30to40GB     = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 29999999999) -and (([convert]::ToUInt64($_.mailboxsize) -lt 39999999999)))})
$Size40to50GB     = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 39999999999) -and (([convert]::ToUInt64($_.mailboxsize) -lt 49999999999)))})
$Size50to60GB     = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 49999999999) -and (([convert]::ToUInt64($_.mailboxsize) -lt 59999999999)))})
$Size60to70GB     = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 59999999999) -and (([convert]::ToUInt64($_.mailboxsize) -lt 69999999999)))})
$Size70to80GB     = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 69999999999) -and (([convert]::ToUInt64($_.mailboxsize) -lt 79999999999)))})
$Size80to90GB     = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 79999999999) -and (([convert]::ToUInt64($_.mailboxsize) -lt 89999999999)))})
$Size90to100GB    = ($UserMailboxes | Where-Object {(([convert]::ToInt64($_.mailboxsize) -gt 89999999999) -and (([convert]::ToUInt64($_.mailboxsize) -lt 99999999999)))})

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("0GB to 4GB")
if ($Size0to4GB -eq "") {
    $row.NumberOfMailboxes= "0"
}else{
    $row.NumberOfMailboxes= $Size0to4GB.Count
}
$row.NumberOfMailboxes= $Size0to4GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("4GB to 10GB")
$row.NumberOfMailboxes= $Size4to10GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("10GB to 20GB")
$row.NumberOfMailboxes= $Size10to20GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("20GB to 30GB")
$row.NumberOfMailboxes= $Size20to30GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("30GB to 40GB")
$row.NumberOfMailboxes= $Size30to40GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("40GB to 50GB")
$row.NumberOfMailboxes= $Size40to50GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("50GB to 60GB")
$row.NumberOfMailboxes= $Size50to60GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("60GB to 70GB")
$row.NumberOfMailboxes= $Size60to70GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("70GB to 80GB")
$row.NumberOfMailboxes= $Size70to80GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("80GB to 90GB")
$row.NumberOfMailboxes= $Size80to90GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

$row = $MailboxSizeOverviewTable.NewRow()
$row.Mailbox_Size= ("90GB to 100GB")
$row.NumberOfMailboxes= $Size90to100GB.Count
$MailboxSizeOverviewTable.Rows.Add($row)

# Get the data out
$MailboxSizeOverviewTable | Export-Csv -path '.\MailboxSizeOverview.csv' -NoTypeInformation
Import-Csv '.\MailboxSizeOverview.csv' | Export-Excel $fileNameExcelOutput -Autosize -TableName $MailboxSizeOverviewTable.TableName -WorksheetName 'MailboxSizeOverview'

```

**MS Graph**

https://joymalya.com/powershell-ms-graph-api-part-2/

MS Graph heeft geen ondersteuning voor het opvragen van mailbox statistieken, het kan wel via hard-gecodeerde HTTP requests, dit moet wel worden verkwerkt

```powershell

```

#### Pivot 11 (STATUS: TODO MAIL!)

#### Pivot 12 (STATUS: TODO MAIL!)

#### Pivot 13 (STATUS: TODO MAIL!)

#### Pivot 14 (STATUS: TODO MAIL!)

#### Pivot 15 (STATUS: CHECK!)

**MS Graph**

```powershell
$upnArray = @()
$count = 0

# Get all users from the MgUser command and loop through them
Get-MgUser | ForEach-Object {
    # Add the user principal name to the array
    $upnArray += $_.UserPrincipalName
}

foreach ($upn in $upnArray) {
   $cmd = (Get-MgUser -UserID $upn -Select Mail)
   if (($cmd.Mail) -match "\.onmicrosoft\.com$")
   {
    $count++
   }
}


Write-Host "=== RESULTS ==="
Write-Host "$count users have '.onmicrosoft.com' in their mailaddress"
Write-host "There are in total $($upnArray.Count) users"
```

#### Pivot 16 (STATUS: TODO MAIL!)

#### Pivot 17 (STATUS: TODO MAIL!)

#### Pivot 18 (STATUS: TODO MAIL!)

#### Pivot 19 (STATUS: CHECK!)

**MS Graph**

```powershell
$upnArray = @()
# Get all users from the MgUser command and loop through them
Get-MgUser | ForEach-Object {
    # Add the user principal name to the array
    $upnArray += $_.UserPrincipalName
}

foreach ($upn in $upnArray) {
   $cmd = (Get-MgUserLicenseDetail -UserID $upn)
   $servicePlans = $cmd.ServicePlans
   Write-Host "User: $($upn) --- Licenses: $($servicePlans.ServicePlanName)"
}
```

#### Pivot 20 (STATUS: COUNT IMPLEMENTEREN!)

**MS Graph**

```powershell
$results=@()
$users = Get-MgUser -All
$emailCount = $fido2Count = $appCount = $passwordCount = $phoneCount = $softwareoathCount = $tempaccessCount = $hellobusinessCount = 0

foreach ($user in $users) {

Write-Host  "`n$($user.UserPrincipalName)";
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

Write-Host "Usage of email: $($emailCount)"
Write-Host "Usage of fido2: $($fido2Count)"
Write-Host "Usage of app: $($appCount)"
Write-Host "Usage of password: $($passwordCount)"
Write-Host "Usage of phone: $($phoneCount)"
Write-Host "Usage of softwareoath: $($softwareoathCount)"
Write-Host "Usage of tempaccess: $($tempaccessCount)"
Write-Host "Usage of hellobusiness: $($hellobusinessCount)"
```

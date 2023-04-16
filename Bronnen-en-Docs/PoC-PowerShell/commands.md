# PoC PS-commands

## Voorbereiding

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
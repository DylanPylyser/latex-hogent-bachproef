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
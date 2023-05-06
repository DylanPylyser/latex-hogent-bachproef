# Vergelijkende studie

## Query 1: GET domain

### Azure AD Graph

- GET
- URL: https://graph.windows.net/ffa43659-6d7d-4f83-a517-838af35d1353/domains
- api-version: 1.6

Response:

```json
{
  "odata.metadata": "https://graph.windows.net/ffa43659-6d7d-4f83-a517-838af35d1353/$metadata#domains",
  "value": [
    {
      "authenticationType": "Managed",
      "availabilityStatus": null,
      "isAdminManaged": true,
      "isDefault": true,
      "isDefaultForCloudRedirections": false,
      "isInitial": true,
      "isRoot": true,
      "isVerified": true,
      "name": "25ky3d.onmicrosoft.com",
      "supportedServices": ["Email", "OfficeCommunicationsOnline"],
      "forceDeleteState": null,
      "state": null,
      "passwordValidityPeriodInDays": 2147483647,
      "passwordNotificationWindowInDays": 14
    }
  ]
}
```

Response Header

```json
{
  "cache-control": "no-cache",
  "client-request-id": "82bc7ed4-db42-414f-8260-73754bca7ce1",
  "content-length": "504",
  "content-type": "application/json; odata=minimalmetadata; streaming=true; charset=utf-8",
  "expires": "-1",
  "ocp-aad-session-key": "fdBtvCAl-u1MdwiAlVK30M92CWxEZDAgZlyGbb7v4d-VJN7rZ2xgkzBKoAHrf6IKxMzpE_PRkxHjngUBDHblxDHpu1yI_KzleSizViNsBuBAbxGLjmc1EqjMF1_rPmSO.mPddsNJTmFCzKMBchCpYgc_n1UQvQe9reWesQHDTlUo",
  "pragma": "no-cache",
  "request-id": "dfd33cc1-ca0e-4964-ae48-0d3f6f222514"
}
```

### Microsoft Graph

- GET
- Version 1.0
- URL: https://graph.microsoft.com/v1.0/domains

Response:

```json
{
  "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#domains",
  "value": [
    {
      "authenticationType": "Managed",
      "availabilityStatus": null,
      "id": "25ky3d.onmicrosoft.com",
      "isAdminManaged": true,
      "isDefault": true,
      "isInitial": true,
      "isRoot": true,
      "isVerified": true,
      "supportedServices": ["Email", "OfficeCommunicationsOnline"],
      "passwordValidityPeriodInDays": 2147483647,
      "passwordNotificationWindowInDays": 14,
      "state": null
    }
  ]
}
```

Response headers

```json
{
  "cache-control": "no-cache",
  "client-request-id": "45bd0201-69d2-f78c-cee8-aaedfce8b3d8",
  "content-type": "application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=false;charset=utf-8",
  "request-id": "0f814559-7945-48c7-bb2c-a5929a768b32"
}
```

## Query 2: POST Create User

### Azure AD Graph

- POST
- URL: https://graph.windows.net/ffa43659-6d7d-4f83-a517-838af35d1353/users
- api: 1.6

Request body

```json
{
  "accountEnabled": true,
  "displayName": "Alex Wu",
  "mailNickname": "AlexW",
  "passwordProfile": {
    "password": "Test1234",
    "forceChangePasswordNextLogin": false
  },
  "userPrincipalName": "Alex@25ky3d.onmicrosoft.com"
}
```

Response

```json
{
  "odata.metadata": "https://graph.windows.net/ffa43659-6d7d-4f83-a517-838af35d1353/$metadata#directoryObjects/@Element",
  "odata.type": "Microsoft.DirectoryServices.User",
  "objectType": "User",
  "objectId": "5c9ab483-c9b4-4ab3-a857-4763c055ef53",
  "deletionTimestamp": null,
  "accountEnabled": true,
  "ageGroup": null,
  "assignedLicenses": [],
  "assignedPlans": [],
  "city": null,
  "companyName": null,
  "consentProvidedForMinor": null,
  "country": null,
  "createdDateTime": null,
  "creationType": null,
  "department": null,
  "dirSyncEnabled": null,
  "displayName": "Alex Wu",
  "employeeId": null,
  "facsimileTelephoneNumber": null,
  "givenName": null,
  "immutableId": null,
  "isCompromised": null,
  "jobTitle": null,
  "lastDirSyncTime": null,
  "legalAgeGroupClassification": null,
  "mail": null,
  "mailNickname": "AlexW",
  "mobile": null,
  "onPremisesDistinguishedName": null,
  "onPremisesSecurityIdentifier": null,
  "otherMails": [],
  "passwordPolicies": null,
  "passwordProfile": null,
  "physicalDeliveryOfficeName": null,
  "postalCode": null,
  "preferredLanguage": null,
  "provisionedPlans": [],
  "provisioningErrors": [],
  "proxyAddresses": [],
  "refreshTokensValidFromDateTime": "2023-05-06T10:53:45.6717827Z",
  "showInAddressList": null,
  "signInNames": [],
  "sipProxyAddress": null,
  "state": null,
  "streetAddress": null,
  "surname": null,
  "telephoneNumber": null,
  "usageLocation": null,
  "userIdentities": [],
  "userPrincipalName": "Alex@25ky3d.onmicrosoft.com",
  "userState": null,
  "userStateChangedOn": null,
  "userType": "Member"
}
```

Response Headers

```json
{
  "cache-control": "no-cache",
  "client-request-id": "b47a729f-c944-44a1-a6a3-5f9d84b0b73f",
  "content-length": "1387",
  "content-type": "application/json; odata=minimalmetadata; streaming=true; charset=utf-8",
  "expires": "-1",
  "ocp-aad-session-key": "EYQrEhc2N70kCFUeBIqLlWWUP3hrsgkL30C0nXsJvluKBdRw_Mscn9gW7AjIte89jEuQySfER1unhouAnnpsNdhr6YtCkGLhk9x8AUl4uYn5QE9ja2813oc0bCYKfe-lomliRb64txAXvuE9sO3FITcN0gYlDj_QT4YRQlqqFeQ.d2YRHqkmqEb4v8cnLTodejChllPpmXofT7S1buL6cO8",
  "pragma": "no-cache",
  "request-id": "40d52611-5733-411b-aa59-1e76643a6ff4"
}
```

### Microsoft Graph

- POST
- v1.0
- https://graph.microsoft.com/v1.0/users

Request body

!!! VERSCHIL: forceChangePasswordNextLogin > forceChangePasswordNextSignin

```json
{
  "accountEnabled": true,
  "displayName": "Alex Wu",
  "mailNickname": "AlexW",
  "passwordProfile": {
    "password": "Test1234",
    "forceChangePasswordNextSignin": false
  },
  "userPrincipalName": "Alex@25ky3d.onmicrosoft.com"
}
```

Response

```json
{
  "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#users/$entity",
  "id": "bc521ac5-ab90-4427-880d-c1c52ffe3ee7",
  "businessPhones": [],
  "displayName": "Alex Wu",
  "givenName": null,
  "jobTitle": null,
  "mail": null,
  "mobilePhone": null,
  "officeLocation": null,
  "preferredLanguage": null,
  "surname": null,
  "userPrincipalName": "Alex@25ky3d.onmicrosoft.com"
}
```

Response headers

```json
{
  "cache-control": "no-cache",
  "client-request-id": "dce37693-434c-e47b-0cf5-b08bc11752fb",
  "content-type": "application/json;odata.metadata=minimal;odata.streaming=true;IEEE754Compatible=false;charset=utf-8",
  "location": "https://graph.microsoft.com/v2/ffa43659-6d7d-4f83-a517-838af35d1353/directoryObjects/bc521ac5-ab90-4427-880d-c1c52ffe3ee7/Microsoft.DirectoryServices.User",
  "request-id": "fab6e8dc-c90c-4377-a54f-b67034f3a07e"
}
```

## Query 3: PATCH update user

**Azure AD Graph**

- PATCH
- URL: https://graph.windows.net/ffa43659-6d7d-4f83-a517-838af35d1353/users/Alex@25ky3d.onmicrosoft.com
- 1.6

Request body

```json
{
  "displayName": "Alex A. Wu"
}
```

Response => Geen response = gelukt

!!! Proof: Screenshot met User

**Microsoft Graph**

- PATCH
- v1.0
- URL: https://graph.microsoft.com/v1.0/users/{407074b1-6d01-4aca-8869-41b76fbd7b67}

request body

```json
{
  "displayName": "Alex A. Wu"
}
```

response => geen reponse = gelukt

## Query 4: DELETE user

**Azure AD Graph**

- DELETE
- URL: https://graph.windows.net/ffa43659-6d7d-4f83-a517-838af35d1353/users/Alex@25ky3d.onmicrosoft.com
- 1.6

Response => Geen response = gelukt

!!! Proof: Screenshot met User

**Microsoft Graph**

- DELETE
- v1.0
- URL: https://graph.microsoft.com/v1.0/users/{407074b1-6d01-4aca-8869-41b76fbd7b67}

Response => Geen response = gelukt

!!! Proof: Screenshot met User

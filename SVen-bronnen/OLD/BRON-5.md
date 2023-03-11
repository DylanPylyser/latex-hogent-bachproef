# Modern authentication with Azure AD for web applications

> Link: http://ptgmedia.pearsoncmg.com/images/9780735696945/samplepages/9780735696945.pdf

## Notes

### De applicatie

Directory Graph API -> Query in een directory en gebruik een GET om een applicatie object op te vragen (in JSON formaat).

Volgens het boek is het gebruik van Graph gemakelijk te gebruiken doordat het gebruik maakt van een sample web app waarin je dingen kan testen en kan opvragen. Vroeger was dit via: https://graphexplorer.cloudapp.net/.

Hij maakte gebruik van een test query:

```
https://graph.windows.net/developertenant.onmicrosoft.com/
applications?$filter=appId+eq+'e8040965-f52a-4494-96ab-0ef07b591e3f'&api-version=1.5
```

Hij zei dat het `$`-teken een typische indicator is van OData.

Deze query gaf bijvoorbeeld het volgende terug in JSON:

```json
{
"odata.metadata": "https://graph.windows.net/developertenant.onmicrosoft.
com/$metadata#directoryObjects/Microsoft.DirectoryServices.Application",
"value": [
{
"odata.type": "Microsoft.DirectoryServices.Application",
"objectType": "Application",
"objectId": "c806648a-f27d-43fd-9f18-999f7708fcfc",
"deletionTimestamp": null,
"appId": "e8040965-f52a-4494-96ab-0ef07b591e3f",
"appRoles": [],
"availableToOtherTenants": false,
"displayName": "WebAppChapter5",
"errorUrl": null,
"groupMembershipClaims": null,
"homepage": "https://localhost:44300/",
"identifierUris": [
"https://localhost:44300/WebProjectChapter5"
],
"keyCredentials": [],
"knownClientApplications": [],
"logoutUrl": null,
"oauth2AllowImplicitFlow": false,
"oauth2AllowUrlPathMatching": false,
"oauth2Permissions": [
{
"adminConsentDescription": "Allow the application to access WebAppChapter5 on behalf
of the signed-in user.",
"adminConsentDisplayName": "Access WebAppChapter5",
"id": "00431d04-5334-4da6-8396-0e6f54631f10",
"isEnabled": true,
"type": "User",
"userConsentDescription": "Allow the application to access WebAppChapter5 on your
behalf.",
"userConsentDisplayName": "Access WebAppChapter5",
"value": "user_impersonation"
}
],
"oauth2RequirePostResponse": false,
"passwordCredentials": [],
"publicClient": null,
"replyUrls": [
"https://localhost:44300/"
],
"requiredResourceAccess": [
{
"resourceAppId": "00000002-0000-0000-c000-000000000000",
"resourceAccess": [
{
"id": "311a71cc-e848-46a1-bdf8-97ff7156d8e6",
"type": "Scope"
}
]
}
],
"samlMetadataUrl": null
}
]
}
```

Er zijn 2 meta onderdelen aanwezig in bovenstaande JSON-code:

- objectId
  - is the unique identifi er for this Application entry in the directory. Note, this is
    not the identifi er used to identify the app in any protocol transaction—you can think of it as
    the ID of the row where the Application object is saved in the directory store. It is used for
    referencing the object in most directory queries and in cross-entity references.
- deletionTimestamp
  - is always null, unless you delete the Application, which in that case it
    records the instant in which you do so. Azure AD implements most eliminations as soft deletes
    so that you can repent and restore the object without too much pain should you realize the
    deletion was a mistake.

### Properties used for authentication

**Naamgeving in overvloed**

Een belangrijk ding om in gedachten te houden: Hoewel ik me in dit boek concentreer op OAuth2 en OpenID Connect, moet het Application object alle protocollen ondersteunen die Azure AD implementeert. Zoals je in eerdere hoofdstukken hebt gezien, delen alle claimgeoriënteerde protocollen enkele gemeenschappelijke concepten - verstrekker, publiek, URL's om geretourneerde tokens te ontvangen, enzovoort. Dat helpt om de lijst van eigenschappen kort te houden, aangezien u de URL waar u de tokens wilt terugkrijgen slechts één keer hoeft op te geven en slechts één keer hoeft te gebruiken. de tokens slechts één keer hoeft op te geven en deze met alle protocollen kunt gebruiken. Er ontstaat echter ook een probleem: als WS-Federation noemt die URL wsreply, en OAuth2 noemt hem redirect_uri, hoe moet de corresponderende eigenschap in het Application object genoemd worden? U zult zien dat deze vraag op vele op veel verschillende manieren is beantwoord via het objectmodel, grotendeels gedreven door historische omstandigheden (bijvoorbeeld welke protocollen het eerst werden geïmplementeerd). Dat heeft tot enige verwarring geleid, wat leidde tot pogingen tot herstel door die eigenschappen in de Azure portal UX te tonen onder verschillende labels ... wat leidde tot verdere verwarring. Dit is gewoon een heads-up om te wijzen op het belang om heel precies te zijn wanneer je redeneert over Toepassingen en protocolliteratuur.```

!!! Todo: Hij geeft dan ook op pagina 44-47 (of 69 van 129) een lijst met alle properties met uitleg

Graph gebruikt identifiers:
Voorbeeld: rescourceAppId = `00000002-0000-0000-c000-000000000000` is gereserveerd voor Graph bij alle tenants
2de voorbeeld: Id = `311a71cc-e848-46a1-bdf8-97ff7156d8e6` staat voor het inloggen en raadplegen van een user's profile.

!!! Todo: zie pagina 54 voor extra uitleg over bovenstaande ID's

!!! ... Nog eens doornemen vanaf 54, er komen veel security aspecten aanbod, dit is te veel informatie voor de Graph API

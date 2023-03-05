# Azure Active Directory: What is the Graph API?

> Link: https://www.kuppingercole.com/blog/kuppinger/azure-active-directory-what-is-the-graph-api

## Notes

Binnen Azure AD is er een Graph API. De main API voor toegang tot AAD. Vergelijkbare API als die van Facebok.

De naam Graph is omdat het letterlijk een graaf is (van node tot node). In IT termen wordt deze graaf omgezet naar een API, Graph API.

De AAD Graph API maakt het mogelijk om AAD data te doorlopen. Je kan er CRUD operaties mee uitvoeren via REST API. Dit kan dienen voor webtoepassingen, mobiele apps en bedrijfsprocessen.

De Graph API is REST omdat REST nieuw en veel gebruikt wordt, in tegenstelling to oudere manieren zoals LDAP C API.

Graph API biedt een brede reeks aan queries aan voor metadata, zoals gebruikers, groupen... Ook een mogelijkheid om "differentiële" queries te gebruiken om alleen de vorige (aangepaste) data op te vragen van een vorige query. Deze 2de soort queries zijn heel interessant om AAD en andere data stores met elkaar te synchroniseren.

De toegang tot de Graph API gebeurd in 2 stappen:

1. authenticatie (tanant-ID, client-ID...) wordt uitgevoerd op de AAD authenticatiediensten.
2. De authenticatiedienst suurt een JWT token terug

Deze token wordt gebruikt om Graph API-query's uit te voeren. De API maakt ook gebruik van een RBAC-model, deze autoriseert elk verzoek en stuurt een "geslaagd" resultaat terug als de autorisatie gelukt is.

Graph is eenvoudig en ook krachtig op vlak van AAD data te raadplegen. Het is de opvolger van traditionele benaderingen voor directory-toegang zoals LDAP (dat complex is). Plus, REST is vertrouwd bij vele webontwikkelaars, dit maakt het simpeler om te gebruiken en daarnaast is er veel info over REST beschikbaar.

Voor niet-ontwikkelaars is het gebruik van AAD Graph simpel om toepassingen te maken met Azure AD. Alle informatie van werknemers, klanten, orgs... kunnen nu worden gebruikt en toegevoegd via Graph in AAD. Deze mogelijkheden worden op een veilige manier toegepast door het RBAC-model. De Graph API zorgt ervoor dat de AAD van een Directory Service naar een flexibele manier om aan alle instances van een organisatie te geraken.

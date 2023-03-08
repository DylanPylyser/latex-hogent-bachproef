# Planning BP:

## Deliverables + Planning

- [ ] Voorwoord
- [ ] Samenvatting
- [ ] Inleiding
- [ ] Stand-van-zaken (Lit-studie)
  - [ ] OUD: AAD Graph API:
    - [ ] Intro (wat, waarom...)
    - [ ] Logica
    - [ ] Tenants
    - [ ] Gebruik
    - [ ] Security
  - [ ] NIEUW: MS Graph
    - [ ] Intro
    - [ ] Logica
    - [ ] Tenants
    - [ ] Gebruik
    - [ ] Security
  - [ ] DEEL 1: Vergelijking (op de 4 pijlers + intro)
  - [ ] DEEL 2: PoC
    - [ ] Small PoC: Learn bijvoorbeeld (node.js app?)
    - [ ] Real PoC: Auditing script herschrijven
- [ ] Methodologie
- [ ] Conclusie
- [x] Voorstel

**01/03 - 08/03**

| Task             | Status |
| ---------------- | ------ |
| Literatuurstudie | TO DO  |

**08/03 - 15/03**

| Task             | Status |
| ---------------- | ------ |
| Literatuurstudie | TO DO  |
| Proof-of-Concept | TO DO  |

# Notes BP - Literatuurstudie

## OLD: Azure AD Graph (API)

Werkwijze: Google scholar en zoeken op term

### BRON-1: Feature differences between Azure AD Graph and Microsoft Graph

> Link: https://learn.microsoft.com/en-us/graph/migrate-azure-ad-graph-feature-differences

### BRON-2: Azure Active Directiory: What is the Graph API

> Link: https://www.kuppingercole.com/blog/kuppinger/azure-active-directory-what-is-the-graph-api

- [x] Done

### BRON-3: Azure AD Graph to Microsoft Graph migration FAQ

> Link: https://learn.microsoft.com/en-us/graph/migrate-azure-ad-graph-faq

### BRON-4: Identity Security with Azure Active Directory

> Link:

### BRON-5: Modern authentication with Azure AD for web applications

> Link: http://ptgmedia.pearsoncmg.com/images/9780735696945/samplepages/9780735696945.pdf

### BRON-6: Active Directory Custom Data Extensions:

> Link: https://link.springer.com/chapter/10.1007/978-1-4842-5040-2_6

### BRON-7: Introduction to Authorization

> Link: https://link.springer.com/chapter/10.1007/978-1-4842-5040-2_9

### BRON-8: Authentication and Authorization Mechanism for Cloud Security

> Link: https://www.researchgate.net/profile/Dr-Chandra-Jadala/publication/335842661_Authentication_and_Authorization_Mechanism_for_Cloud_Security/links/5d7fe326a6fdcc66b001a77f/Authentication-and-Authorization-Mechanism-for-Cloud-Security.pdf

## NEW: Microsoft Graph

# Bachelorproef toegepaste informatica

Deze repository bevat LaTeX sjablonen voor gebruik bij het opmaken van je bachelorproef toegepaste informatica:

- [Het onderzoeksvoorstel](./voorstel/)
- [De bachelorproef zelf](./bachproef/)
- [Een poster](./poster/)

**LET OP.** Voor het academiejaar 2022-2023 zijn er nieuwe sjablonen gepubliceerd die conform zijn met de huidige huisstijl van HOGENT.

## Aan de slag

Om deze sjablonen te gebruiken, kan je de repository downloaden via de groene knop rechtsboven deze pagina. Het is beter een ZIP te downloaden en zelf een Github repository te initialiseren dan deze repository te klonen. In het laatste geval neem je dan immers ook de gehele historiek van wijzigingen in het sjabloon zelf mee en dat is niet relevant voor jouw werk. Maak daarna een Github-repository voor jezelf aan (`git init .`). Gebruik altijd een versiebeheersysteem om een LaTeX-document bij te houden! Creëer een Github-repository die je deelt met je promotor en/of andere belanghebbenden.

Gebruik deze repository ook om andere artefacten/deelresultaten van je bachelorproef bij te houden, zoals nota's, ruwe resultaten, scripts/programmacode, enz. Gebruik bij voorkeur tekstgebaseerde bestandsformaten, bijvoorbeeld Markdown ipv Word-documenten of CSV (Comma Separated Values) ipv Excel-werkbladen.

## Lettertypes

Je hebt de volgende lettertypes nodig. Ze zijn meegeleverd [in deze repository](fonts/), dus je kan ze makkelijk installeren.

- Montserrat (officieel hoofdlettertype van de HOGENT huisstijl)
- Fira Code (monogespatieerde tekst)
- Fira Math (wiskundige formules)

## LaTeX editor, bibliografie

Qua editors voor LaTeX zijn er verschillende keuzemogelijkheden. We raden [TeXstudio](https://www.texstudio.org/) aan en [Jabref](https://www.jabref.org/) voor het bijhouden van een bibliografische databank. Ook Visual Studio Code is een zeer goede LaTeX-editor (via de plugin LaTeX Workshop van James Yu).

### TeXstudio configureren

Kies in het menu voor Options > Configure TeXstudio en pas volgende instellingen aan:

- Build:
  - Default compiler: "xelatex"
  - Default Bibliography Tool: "Biber"
- Commands:
  - Latexmk: `xelatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error %`
- Editor:
  - Indentation mode: Indent and Unindent Automatically
  - Replace Indentation Tab by Spaces: Aanvinken
  - Replace Tab in Text by spaces: Aanvinken
  - Replace Double Quotes: English Quotes: ‘‘’’

Tips:

- Gebruik functietoets **F5** om het document te compileren en het resultaat te bekijken.
- Als na compilatie de bibliografie niet zichtbaar is, probeer die dan expliciet te compileren met **F8** en daarna opnieuw **F5**

### Jabref

Kies voor Options > Preferences en pas volgende instellingen aan:

- General:
  - Default encoding: UTF-8
  - Default library mode: biblatex
- File:
  - (optioneel) Main file directory: geef hier de directory waar je de PDFs van gevonden bronnen bijhoudt. Als je dezelfde bestandsnaam gebruikt als je BibtexKey, dan vindt JabRef de PDF en kan je die openen vanuit het overzicht.

## Bachelorproef in het Engels

Het bachelorproefsjabloon is voorzien op tekst in hetzij Nederlands, hetzij Engels. Wanneer je je bachelorproef in het Engels schrijft, pas je de instellingen van de documentclass aan. Nu staat er:

```latex
\documentclass[dutch,dit,thesis]{hogentreport}
```

Je kan `dutch` verwijderen of vervangen door `english`.

Aandachtspunten:

- Het voorblad blijft in het Nederlands (behalve je titel), en dit is ook de bedoeling
- Pas de naam van het diploma aan (regel met commando`\degreesought{}`) in _Bachelor in applied computer science_.
- Je moet in dit geval ook een Nederlandse vertaling van je samenvatting voorzien. Het sjabloon houdt daar ook rekening mee:
  - De samenvatting in de hoofdtaal van het document komt [op lijn 40 van het LaTeX-bestand](https://github.com/HoGentTIN/bachproef-latex-sjabloon/blob/master/bachproef/samenvatting.tex#L40)
  - De Nederlandse vertaling ervan komt [op lijn 31](https://github.com/HoGentTIN/bachproef-latex-sjabloon/blob/master/bachproef/samenvatting.tex#L31)

## Vragen, fouten, verbeteringen

Bugs, vragen voor verbeteringen, enz. zijn welkom! Je kan die registreren via de Issues. Je kan zelf ook verbeteringen aanbrengen via Pull Requests.

## Bijdragen

- De vormgeving van het bachelorproefsjabloon is gebaseerd op het werk van [Pieter van der Kloet](https://github.com/pvdk/hogent-latex-thesis). Dat sjabloon wordt nu [hier verder onderhouden](https://github.com/HoGentTIN/latex-hogent-report) door Bert Van Vreckem
- Het sjabloon voor het bachelorproefvoorstel [wordt hier bijgehouden](https://github.com/HoGentTIN/latex-hogent-article).

Volgende personen hebben bijgedragen aan deze sjablonen:

- Bert Van Vreckem
- Jens Buysse
- Chantal Teerlinck
- Jeroen Maelbrancke
- Matts Devriendt
- Niels Corneille
- Patrick Van Brussel
- Simon Rondelez

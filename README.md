# Planning BP:

## Deliverables + Planning

- [ ] Voorwoord
- [ ] Samenvatting
- [ ] Inleiding
- [ ] Stand-van-zaken
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

### Azure automatisatie via Ansible en Cloud-init

Gesprek Van Vreckem:

- Focus meer op het eerste deel: de configuratie van Azure zelf om een virtuele omgeving na te bootsen

  - Welke tools zijn er? (zie Azure document) => Vergelijkende studie?
    - Ansible
    - Terraform
    - Packer?
    - Bicep? (is wel een DSL?)
  - Denk aan de levenscyclus van zo'n infrastructuur (cloud management of infrastructure ... lifecycle) => zoek een bron/foto:
    - 1. configureren (in de cloud)
    - 2. depoloyen
    - 3. Omgeving zelf configureren
    - 4. orchestration
  - Gebruik het tweede deel dan als realtische omgeving MAAR focus op de eerste stap die is interessanter en er is meer nood aan
    - in AWS is het iets populairder, binnen Azure nog niet

Onderwerp: Automatiseren van Azure configuraties via Infrastructure Automation tools voor het opzetten van een virtuele omgeving.

- Idee: **Terraform?**
- Idee: **Ansible**

  - Wat interessant is dat Ansible zowel Azure (buiten de VM) als de VM zelf (binnen) kan configureren!!!

- Idee: **Cloud-init**

  - Werkt alleen binnen in de VM vanaf de deployment ervan

- In Azure (configuratie)

  - Ansible is mogelijk
  - Terraform => ONDERZOEKEN !!!

- In de VM:

  - Cloud-Init naar Ansible is mogelijk vanuit de VM!
    - Cloud-init automatiseert direct vanaf de deployment van de VM, het kan dus Ansible aanspreken en doen opstarten!

Notes:

Inspiratie: Infrastructure Automation, DevOps project en volgende BP: "Het gebruik van Ansible als tool voor het automatiseren van een Windows- en Linux-omgeving"

- Dit zijn titels, geen OV'en
  - Het gebruik van Ansible als tool voor het automatiseren van virtuele testomgevingen binnen Azure.
  - Het gebruik van Ansible als tool voor het automatiseren virtuele netwerken en cloud-instanties binnen Azure.
  - - Conclusie: NIET alleen Ansible gebruiken

--- (met Cloud-init) om ook volledig Azure te automatiseren vanaf de eerste deployment (Ansible als config-mgmt voor Azure)

- Het gebruik van Cloud-init en Ansible als tool voor het automatiseren van een Linux-omgeving in Azure.

**Notes: noteren bij co-promotor => "iemand van Easi"**

Bronnen:

- https://galaxy.ansible.com/azure/azcollection?extIdCarryOver=true&sc_cid=701f2000001OH7YAAW
- https://www.youtube.com/watch?v=Ff0DoAmpv6w

---

---

---

- Vergelijking van verschillende identity providers zoals azure ad, active directory maar zeker ook Octa.
  - Identity provider
    - Azure AD
    - AD
    - Octa
  - Vergelijking tussen deze 3
- Gebruik van 1 identity provider om in te loggen op verschillende platvormen...
  - Identity provider
    - Welke ???
  - Platvormen???
    - Dieper???
- Zero trust op hybrid endpoint devices is eventueel wel een brede optie.
  - Zero trust?
    - Niks "implicitet" binnenlaten van binnen naar buiten
    - Vroeger: perimeter security
  - Endpoint?
  - Hybrid (Cloud, endpoint...)?
  - => Impact van zero trust op een

=> Zero Trust implementatie via Azure Active Directory als beveiliging voor endpoint devices.

=> Het gebruik van Ansible als tool voor het automatiseren van een DevOps Azure omgeving.

Kernwoorden van OV => Zero Trust implementatie via Azure Active Directory als beveiliging voor endpoint devices.:

- Zero trust:
  - Zero trust (vroeger perimeter security => uw muur zo hoog mogelik maken, maar dat is niet meer mogelijk door work from home)
  - Zero trust hou je de menselijke versie van betrouwbaarheid tegen! iemand met een badge kan nog steeds "onbetrouwbaar" zijn
  - Zero Trust: Never trust, always verify => when verified, then trust
  - Implement Least Privilege => minimum rechten voor hun job, niets overbodig
  - Assume Breach: voorbereidt op aanvallen
  - Zero trust is nodig om de bad guys zowel binnen- als buitenaf weg te houden => elke zone is untrusted
- Endpoint (Protection):
  - Het beveiligen van de laatste users in een netwerk (de gebruikers) bv. gsm, computer, smart watch...
  - 3 principes:
    - EPP (Endpoint protection platform) => lijkt op een anti-virus
    - EDR (Endpoint detection and response) => analysis, signatures
    - XDR (Extended detections and response solutions) => state-of-the-art
  - Endpoint protection heeft vele voordelen: tijd, kost...
  - Next-gen antivirus => behaviour analysis, AI, machine learning...
  - MDM, vulnerability management, access governance, PAM, email protection
  - tips:
    - on-premise of cloud-based => cloud-based
    - sandboxes voor het onderzoeken van virussen
- Hybrid cloud:
  - bestaat uit private and public cloud
- Hybrid endpoint

- Zero Trust Security Implementatation (programma's):

  - Azure AD
  - Endpoint manager
  - Cloud App Security

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

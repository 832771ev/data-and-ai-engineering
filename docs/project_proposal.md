# Project Proposal Template

## Student Information
- Name: Erwin Vinke
- Student ID: 832771
- Email: 832771ev@eur.nl

## Business Context
Describe the business or domain you're working with:
- Industry: Financiële dienstverlening
- Company/Organization: a.s.r. Nederland NV
- Business Problem: 

Binnen a.s.r. wordt gewerkt aan de ontwikkeling van een Marketing Data Platform in Microsoft Azure. Het doel hiervan is om verschillende databronnen, waaronder online bezoekersgedrag, offline klantdata en gegevens uit Microsoft Dynamics, met elkaar te verbinden. Dit moet toekomstige marketingtoepassingen mogelijk maken, zoals visitor stitching, centraal consent management, klantsegmentatie en gepersonaliseerde marketing.

Tealium is een Customer Data Platform (CDP) en een oplossing voor tag management waarmee a.s.r. online bezoekersinteracties, zoals page views, clicks en andere events, kan verzamelen en verwerken. Via Tealium EventStream kunnen deze events vervolgens server-side worden doorgestuurd naar andere systemen, waaronder het Marketing Data Platform in Azure.

Een belangrijk aandachtspunt is de kwaliteit en betrouwbaarheid van deze data. Wijzigingen aan websites en bestelfunnels kunnen ertoe leiden dat events niet meer worden verstuurd, verplichte parameters ontbreken of afwijkende waarden worden aangeleverd. Hierdoor kunnen datasets onvolledig of onjuist worden en kunnen downstream marketingtoepassingen niet meer naar behoren functioneren.

Het doel van deze opdracht is te onderzoeken hoe dergelijke datakwaliteitsproblemen geautomatiseerd kunnen worden gedetecteerd en hoe de resultaten inzichtelijk kunnen worden gemaakt.

## Data Sources
List the data sources you plan to use:
1. **Primary Source**:
Online bezoekersdata die via Tealium Tag Management wordt verzameld en via Tealium EventStream wordt doorgestuurd naar het Marketing Data Platform in Azure. Voorbeelden zijn onder andere page_view (paginaweergave), calculation_start (starten van een premieberekening), calculation_complete (afronden van een premieberekening) en purchase (afsluiten van een product/polis).

Relevante velden hierin zijn: event name, business line, product name, URL, visitor ID, session ID en event specifieke parameters.

2. **Secondary Source**: [e.g., External market data API]
Een CSV-bestand met een overzicht van de verschillende KPI-events die binnen a.s.r. worden gehanteerd, inclusief de mogelijke parameters per event. Dit bestand dient als referentie voor de validatieregels van het prototype. Voor iedere parameter is vastgelegd welke aanwezigheidseis van toepassing is:

**Mandatory**: De parameter moet aanwezig zijn en een niet-lege waarde bevatten. Wanneer niet aan deze eis wordt voldaan, wordt het event als ongeldig aangemerkt.

**Expected**: De parameter wordt verwacht, maar het ontbreken ervan mag niet leiden tot uitsluiting van het event. Het ontbreken wordt wel geregistreerd als een datakwaliteitsprobleem.

**Optional**: De parameter mag ontbreken. Wanneer de parameter aanwezig is, kan de waarde aanvullend worden gevalideerd. Dit laten we in deze opdracht buiten beschouwing.

4. **Supporting Data**: Niet van toepassing.


## Project Objectives
What will your data pipeline accomplish?
- **Primary Goal**: [Main objective]
- **Secondary Goals**: [Additional objectives]
- **Success Metrics**: [How will you measure success?]

## Technical Approach
- **Data Ingestion**: [How will you extract data?]
- **Data Processing**: [What transformations are needed?]
- **Data Storage**: [Where will you store processed data?]
- **Analytics/ML**: [What insights or models will you create?]

## Timeline
Plan your 12-week project timeline based on your chosen components:

- **Week 1-3**: [Your planned activities]
- **Week 4-6**: [Your planned activities]
- **Week 7-9**: [Your planned activities]
- **Week 10-12**: [Your planned activities]

## Approval
**Instructor Approval**: _________________ **Date**: _________

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
Online bezoekersdata die via Tealium Tag Management wordt verzameld en via Tealium EventStream wordt doorgestuurd naar het Marketing Data Platform in Azure. Voorbeelden zijn onder andere page_view (paginaweergave), calculation_start (starten van een premieberekening), calculation_complete (afronden van een premieberekening) en purchase (afsluiten van een product/polis). Relevante velden hierin zijn: event name, business line, product name, URL, visitor ID, session ID en event specifieke parameters.

2. **Secondary Source**:
Een CSV-bestand met een overzicht van de verschillende KPI-events die binnen a.s.r. worden gehanteerd, inclusief de mogelijke parameters per event. Dit bestand dient als referentie voor de validatieregels van het prototype. Voor iedere parameter is vastgelegd welke aanwezigheidseis van toepassing is:

- **Mandatory**: De parameter moet aanwezig zijn en een niet-lege waarde bevatten. Wanneer niet aan deze eis wordt voldaan, wordt het event als ongeldig aangemerkt.

- **Expected**: De parameter wordt verwacht, maar het ontbreken ervan mag niet leiden tot uitsluiting van het event. Het ontbreken wordt wel geregistreerd als een datakwaliteitsprobleem.

- **Optional**: De parameter mag ontbreken. Wanneer de parameter aanwezig is, kan de waarde aanvullend worden gevalideerd. Dit laten we in deze opdracht buiten beschouwing.

4. **Supporting Data**: Niet van toepassing.


## Project Objectives
What will your data pipeline accomplish?

**Primary Goal**:
- Een prototype ontwerpen, ontwikkelen en evalueren voor de geautomatiseerde validatie en monitoring van de datakwaliteit van Tealium-eventdata in Azure.

**Secondary Goals**:
- De bestaande datastroom van Tealium EventStream naar het Azure Marketing Data Platform analyseren en documenteren.
- De KPI Event specificatie CSV gebruiken om validatieregels voor events en parameters te definiëren en waar mogelijk automatisch toe te passen.
- Ontbrekende parameters, ongeldige waarden, inconsistente velden, dubbele events en afwijkende patronen in eventdata detecteren.
- Onderscheid maken tussen fouten die een event ongeldig maken en afwijkingen die wel gemonitord moeten worden, maar het event niet mogen uitsluiten.
- De resultaten van de datakwaliteitscontroles inzichtelijk maken via een rapportage of een eenvoudig monitoringdashboard.
- Aanbevelingen formuleren voor uitbreiding van het framework naar aanvullende databronnen en complexere datakwaliteitscontroles.

**Success Metrics**:

Het prototype wordt geëvalueerd aan de hand van een gelabelde testdataset met bekende correcte en incorrecte records.

De volgende criteria worden gehanteerd:

1. **Detection rate**: Minimaal 90% van de bewust geïntroduceerde datakwaliteitsproblemen binnen de geïmplementeerde controles wordt gedetecteerd.

2. **False positive rate**: Maximaal 5% van de records die volgens de gedefinieerde validatieregels correct zijn, wordt onterecht als problematisch aangemerkt.

3. **Issue classification**: Gedetecteerde problemen worden correct gecategoriseerd, bijvoorbeeld als volledigheids-, geldigheids-, consistentie- of uniciteitsproblemen, of als afwijkende eventpatronen.

4. **Validation rule compliance**: De validatiepipeline past de aanwezigheidseisen uit de CSV correct toe en maakt onderscheid tussen parameters die verplicht aanwezig moeten zijn, parameters die worden verwacht en optionele parameters.

5. **Monitoring output**: Het framework genereert een gestructureerd overzicht van het aantal verwerkte records, gedetecteerde problemen, probleemcategorieën en getroffen events of parameters.

6. **Reproducibility:** De validatiepipeline kan herhaaldelijk op dezelfde dataset worden uitgevoerd en levert consistente resultaten op.

## Technical Approach
**Data Ingestion**:

De datastroom onderzoeken waarmee Tealium EventStream eventdata via API-connectors doorstuurt naar het Azure Marketing Data Platform. De relevante bronstructuur, het ingestieproces en het doeldatamodel worden in kaart gebracht.

Daarnaast wordt de KPI Event Specification CSV ingelezen. De daarin vastgelegde events, parameters en aanwezigheidseisen worden omgezet naar een gestructureerde configuratie die door de validatiepipeline kan worden gebruikt.

Voor het prototype wordt een representatieve dataset met correcte en bewust incorrecte Tealium-events samengesteld en ingeladen in de geselecteerde Azure-omgeving.

**Data Processing**:

Een dataverwerkingspipeline ontwikkelen die inkomende records controleert aan de hand van vooraf gedefinieerde validatieregels en de specificaties uit de CSV. De eerste versie richt zich op de volgende datakwaliteitsdimensies:

- **Completeness**: Controleren of verplichte parameters aanwezig zijn en of verwachte parameters ontbreken.
- **Validity**: Controleren of waarden voldoen aan toegestane waarden, formaten en eventuele andere validatievoorwaarden.
- **Consistency**: Detecteren van tegenstrijdige waarden of onverenigbare combinaties van velden.
- **Uniqueness**: Detecteren van dubbele events op basis van een geschikte event-ID of combinatie van velden.
- **Timeliness**: Controleren op ontbrekende, ongeldige of onverwachte tijdstempels.
- **Pattern validation**: Detecteren van onverwachte eventfrequenties of relaties tussen events en parameters.

De pipeline legt validatieresultaten en diagnostische informatie vast. Ook wordt onderzocht in welke fase van de dataketen de verschillende controles het beste kunnen plaatsvinden: tijdens ingestion, gedurende transformaties of via monitoring achteraf.

- **Data Storage**:
Voor het prototype worden de testdataset, validatieresultaten en details van gedetecteerde datakwaliteitsproblemen opgeslagen in een lokale database. Hierdoor kan de werking van het framework onafhankelijk van de productieomgeving worden ontwikkeld en getest.

Uiteindelijk is het de bedoeling om de oplossing aan te laten sluiten op de Azure-omgeving van a.s.r., waar de data structureel kan worden opgeslagen en de datakwaliteitscontroles onderdeel kunnen worden van het Marketing Data Platform.

- **Analytics/ML**:
Het prototype start met rule-based datavalidatie, waarbij de validatieregels waar mogelijk automatisch worden afgeleid uit de KPI Event Specification CSV.

Afhankelijk van de resultaten en de beschikbare tijd worden aanvullende statistische technieken of anomaly detection onderzocht. Deze kunnen helpen om onverwachte patronen te identificeren die niet eenvoudig met statische validatieregels af te vangen zijn.

De resultaten bestaan uit datakwaliteitsmetrics, classificaties van problemen en voorbeelden van getroffen records. Deze informatie kan worden weergegeven in een eenvoudig dashboard of een gestructureerde rapportage.

## Timeline
Plan your 12-week project timeline based on your chosen components:

- **Week 1-3**: [Your planned activities]
- **Week 4-6**: [Your planned activities]
- **Week 7-9**: [Your planned activities]
- **Week 10-12**: [Your planned activities]

## Approval
**Instructor Approval**: _________________ **Date**: _________

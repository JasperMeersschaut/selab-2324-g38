# Verslag 2: Databankserver

> Naam verslaggever: Sam Ramaswami

## Beschrijving

Beschrijf de opdracht in eigen woorden. Wat werd er van jullie verwacht? Wat was het doel van de opdracht?

## Antwoorden op de vragen in de opdracht

Voeg hieronder de antwoorden op de vragen in de opdracht toe. Gebruik voor elke vraag een aparte sectie.

### Vraag 1 - Hier de vraag?

Hier beschrijf je het antwoord op de vraag. Voeg eventueel een screenshot, code snippets, enz. toe om je antwoord te ondersteunen. Als je veel code hebt, kun je linken naar een apart bestand in jullie repository (of ergens anders).

## Evaluatiecriteria

Kopieer de evaluatiecriteria uit de opdracht in deze sectie met behulp van een [task list](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#task-lists). Vink de criteria aan die jullie denken behaald te hebben. Geef een korte toelichting bij elk vakje dat jullie **niet** aangevinkt hebben.

De lijst hieronder is een voorbeeld. Vervang deze met de werkelijke evaluatiecriteria.

- [x] Het verslag is geschreven in Markdown
- [ ] De container draait
  - De container wou niet starten aangezien de Docker image niet gebouwd kon worden. Zie probleem 1 voor meer details.

## Problemen en oplossingen

Beschrijf hieronder eventuele problemen die jullie zijn tegengekomen tijdens het uitvoeren van de opdracht, met een korte beschrijving van wat er mis ging en hoe jullie het hebben opgelost (als het jullie gelukt is om het op te lossen). Als het niet gelukt is om het op te lossen, beschrijf dan hoe ver jullie zijn gekomen en wat jullie tegenhield om verder te gaan. Voeg eventuele foutmeldingen, screenshots, enz. toe.

Als jullie geen problemen zijn tegengekomen, schrijf dan "geen problemen ondervonden".

### Probleem 1 - Korte beschrijving van het probleem

Beschrijf hier het probleem uitgebreid met screenshots, code snippets, enz. en de oplossing die jullie al dan niet hebben gevonden.

## Voorbereiding demo

Beschrijf hier hoe je elk evaluatiecriterium zal demonstreren. Geef ook aan welke bestanden, commando's, enz. je zal gebruiken tijdens de demo.

## Uitbredingen

#### 1. Schakel de screen lock uit.

#### 2. Laat de gebruiker osboxes.org automatisch inloggen.

#### 3. Installeer handige applicaties zoals Visual Studio Code.

#### 4. Pas het wachtwoord van de gebruiker osboxes aan. Schrijf dit wachtwoord zeker op in de beschrijving van de VM via Settings > General > Description.

#### 5. Probeer of je met FileZilla/Cyberduck bestanden van/naar de VM kan kopiëren. Dit zal extra configuratie vereisen.

1. Installeer een FTP-server op de VM.

```bash
sudo apt update
sudo apt install vsftpd
```

2. Configureer de FTP-server.

```bash
sudo nano /etc/vsftpd.conf
```

- Zorg ervoor dat de volgende regels in het bestand staan:

```
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
```

3. Herstart de FTP-server.

```bash
sudo systemctl restart vsftpd
```

4. Open filezilla en maak een nieuwe verbinding aan met de VM.

- Ga naar sitebeheer (ctrl + s) > nieuwe site en vul de gegevens in.
  | ![Locatie site manager](./img/2-databankserver/Filezilla/FileZillaStap4.1.png) |
  | :----------------------------------------------------------------------: |
  | Figuur 1. Locatie site manager. |
- Vul het IP-adres, de grbuikersnaam en het wachtwoord in zoals in figuur 2.
  | ![Gegevens site manager](./img/2-databankserver/Filezilla/FileZillaStap4.2.png) |
  | :----------------------------------------------------------------------: |
  | Figuur 2. Gegevens site manager. |

5. Bij een succesvolle verbinding zou je bestanden van/naar de VM moeten kunnen kopiëren. En zou je response 230 moeten krijgen zoals in figuur 3.

  | ![Succesvolle verbinding](./img/2-databankserver/Filezilla/FileZillaStap5.1.png) |
  | :----------------------------------------------------------------------: |
  | Figuur 3. Succesvolle verbinding. |

> Nu kan je succesvol bestanden van/naar de VM kopiëren.
#### 6. Configureer de VM zodat je via SSH kan inloggen vanop je fysieke systeem (via een wachtwoord en/of public/private keypair).

## Reflecties

Wat was moeilijk? Wat was eenvoudig? Wat hebben jullie geleerd van de opdracht? Wat zouden jullie anders doen als jullie het opnieuw moesten doen?

Als jullie nog andere opmerkingen hebben over de opdracht hebben, voel je vrij om ze te delen.

## Bronnen

Maak een lijst van alle bronnen die jullie hebben gebruikt tijdens het uitvoeren van de opdracht: boeken, handleidingen, HOWTO's, blog posts, enz.

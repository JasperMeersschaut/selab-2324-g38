# Verslag 3: Webserver opstellen

> Naam verslaggever: Jasper Meersschaut

## :speech_balloon: Beschrijving

## :thinking: Antwoorden op de vragen in de opdracht

**Wat is \${USER}?**
`${USER}` is een variabele die de gebruikersnaam van de huidige gebruiker bevat.

**Welk commando kan je gebruiken om jouw gebruikersnaam te bepalen?**
Met het commando: `echo $USER`

**Welke commando's gebruik je voor vaultwarden te installeren?**

```bash
docker pull vaultwarden/server:latest
docker run -d --name vaultwarden -v /vw-data/:/data/ --restart unless-stopped -p 80:80 vaultwarden/server:latest
```

**Wat doet het docker pull commando?**
Het docker pull commando haalt een image van een container op van de Docker Hub.

**Hoe kan je alle lokale images bekijken?**
Met het commando: `docker images`

**Hoe bekijk je alle lokaal draaiende containers?**
Met het commando: `docker ps`

**Hoe bekijk je alle lokale containers (inclusief de gestopte containers)?**
Met het commando: `docker ps -a`

**Waarom heeft Vaultwarden HTTPS nodig?**
Vaultwarden heeft HTTPS nodig omdat het een webapplicatie is die gevoelige informatie bevat. HTTPS zorgt ervoor dat de communicatie tussen de client en de server versleuteld is.   
## :memo: Evaluatiecriteria

- [ ] De `docker-compose.yml` bestanden zijn te vinden op de GitHub repository van de groep.
- [ ] Je kan alle instructies van Docker en Docker compose uitvoeren zonder `sudo` te gebruiken.
- [ ] Je hebt Docker geïnstalleerd en kan dit aantonen met `docker --version`.
- [ ] Je hebt Docker Compose geïnstalleerd en kan dit aantonen met `docker compose version`.
- [ ] Je kan de command line instructies om een Vaultwarden container op te zetten toelichten.
- [ ] Je kan de command line instructies om een Portainer container op te zetten toelichten.
- [ ] Je kan een Vaultwarden container opzetten via Docker Compose op de command line. Je kan surfen via HTTPS naar en inloggen op deze container op het fysieke systeem (bv. via <https://192.168.56.20>).
- [ ] Je hebt deze ook gekoppeld aan een web browser client op het fysieke systeem.
- [ ] Je kan een Portainer container opzetten via Docker Compose op de command line. Je kan surfen naar en inloggen op deze container op het fysieke systeem (bv. via <http://192.168.56.20>). Portainer en Vaultwarden worden op het Portainer dashboard weergegeven met als status "Running".
- [ ] Je hebt een verslag gemaakt op basis van het template.
- [ ] De cheat sheet werd aangevuld met nuttige commando's die je wenst te onthouden.

## :question: Problemen en oplossingen

<!-- Beschrijf hieronder eventuele problemen die jullie zijn tegengekomen tijdens het uitvoeren van de opdracht, met een korte beschrijving van wat er mis ging en hoe jullie het hebben opgelost (als het jullie gelukt is om het op te lossen). Als het niet gelukt is om het op te lossen, beschrijf dan hoe ver jullie zijn gekomen en wat jullie tegenhield om verder te gaan. Voeg eventuele foutmeldingen, screenshots, enz. toe.

Als jullie geen problemen zijn tegengekomen, schrijf dan "geen problemen ondervonden". -->

<!-- ### Probleem 1 - Korte beschrijving van het probleem

Beschrijf hier het probleem uitgebreid met screenshots, code snippets, enz. en de oplossing die jullie al dan niet hebben gevonden. -->

## :information_desk_person: Voorbereiding demo

## Mogelijke uitbreidingen

## Reflecties

<!-- Wat was moeilijk? Wat was eenvoudig? Wat hebben jullie geleerd van de opdracht? Wat zouden jullie anders doen als jullie het opnieuw moesten doen?

Als jullie nog andere opmerkingen hebben over de opdracht hebben, voel je vrij om ze te delen. -->

## Bronnen

<!-- Maak een lijst van alle bronnen die jullie hebben gebruikt tijdens het uitvoeren van de opdracht: boeken, handleidingen, HOWTO's, blog posts, enz. -->

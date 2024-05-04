# Verslag: SUBJECT

> Naam verslaggever: NAME

## Beschrijving

Beschrijf de opdracht in eigen woorden. Wat werd er van jullie verwacht? Wat was het doel van de opdracht?

## Antwoorden op de vragen in de opdracht

### Adresseringsschema IPv4

| Toestel | Interface | Subnetnr. | IPv4-adres  | Subnetmask    | IPv4-adres default gateway | Netwerk-adrres | Broadcast-adres | Max aantal hosts |
| :------ | :-------- | :-------- | :---------- | :------------ | :------------------------- | :------------- | :-------------- | :--------------- |
| PC1     | NIC       | 0         | 5.36.56.10  | 255.255.254.0 | 5.36.56.1                  | 5.36.56.0      | 5.36.57.255     | 510              |  
| PC2     | NIC       | 0         | 5.36.56.11  | 255.255.254.0 | 5.36.56.1                  | 5.36.56.0      | 5.36.57.255     | 510              |
| PC3     | NIC       | 1         | 5.36.58.10  | 255.255.254.0 | 5.36.58.1                  | 5.36.58.0      | 5.36.59.255     | 510              |
| PC4     | NIC       | 1         | 5.36.58.11  | 255.255.254.0 | 5.36.58.1                  | 5.36.58.0      | 5.36.59.255     | 510              |
| SW1     | VLAN 1    | 0         | 5.36.56.2   | 255.255.254.0 | 5.36.56.1                  | 5.36.56.0      | 5.36.57.255     | 508              |
| SW2     | VLAN 1    | 1         | 5.36.58.2   | 255.255.254.0 | 5.36.58.1                  | 5.36.58.0      | 5.36.59.255     | 508              |
| R1      | G0/0/0    | 0         | 5.36.56.1   | 255.255.254.0 | n.v.t.                     | 5.36.56.0      | 5.36.57.255     | 508              |
| R1      | G0/0/1    | 1         | 5.36.58.1   | 255.255.254.0 | n.v.t.                     | 5.36.58.0      | 5.36.59.255     | 508              |

### Adresseringsschema IPv6

| Toestel | Interface | Subnet | IPv6-adres                | IPv6-prefixlengte | IPv6-adres default gateway |
| ------- | --------- | ------ | ------------------------- | ----------------- | -------------------------- |
| PC1     | NIC       | 0      | fd5c:32f3:9ce9:1::0010/64 | /64               | fd5c:32f3:9ce9:1::0001     |
| PC2     | NIC       | 0      | fd5c:32f3:9ce9:1::0011/64 | /64               | fd5c:32f3:9ce9:1::0001     |
| PC3     | NIC       | 1      | fd5c:32f3:9ce9:2::0010/64 | /64               | fd5c:32f3:9ce9:2::0001     |
| PC4     | NIC       | 1      | fd5c:32f3:9ce9:2::0011/64 | /64               | fd5c:32f3:9ce9:2::0001     |
| SW1     | VLAN 1    | 0      | fd5c:32f3:9ce9:1::0002/64 | /64               | fd5c:32f3:9ce9:1::0001     |
| SW2     | VLAN 1    | 1      | fd5c:32f3:9ce9:2::0002/64 | /64               | fd5c:32f3:9ce9:2::0001     |
| R1      | G0/0/0    | 0      | fd5c:32f3:9ce9:1::0001/64 | /64               | N.V.T.                     |
| R1      | G0/0/1    | 1      | fd5c:32f3:9ce9:2::0001/64 | /64               | N.V.T.                     |

### Configuratie switches

#### IPv4

| Van/naar | PC1    | PC2    | SW1    | R1 (G0/0/0) | R2 (G0/0/1) | SW2    | PC3    | PC4    |
| -------- | ------ | ------ | ------ | ----------- | ----------- | ------ | ------ | ------ |
| PC1      | n.v.t. |   ja   |   ja   |     nee     |     nee     |   nee  |   nee  |   nee  |
| PC2      |   ja   | n.v.t. |   ja   |     nee     |     nee     |   nee  |   nee  |   nee  |
| SW1      |   ja   |   ja   | n.v.t. |     nee     |     nee     |   nee  |   nee  |   nee  |
| SW2      |   nee  |   nee  |  nee   |     nee     |     nee     | n.v.t. |   ja   |   ja   |
| PC3      |   nee  |   nee  |  nee   |     nee     |     nee     |   ja   | n.v.t. |   ja   |
| PC4      |   nee  |   nee  |  nee   |     nee     |     nee     |   ja   |   ja   | n.v.t. |

#### IPv6

| Van/naar | PC1    | PC2    | SW1    | R1 (G0/0/0) | R2 (G0/0/1) | SW2    | PC3    | PC4    |
| -------- | ------ | ------ | ------ | ----------- | ----------- | ------ | ------ | ------ |
| PC1      | n.v.t. |   ja   |   ja   |     nee     |     nee     |   nee  |   nee  |   nee  |
| PC2      |   ja   | n.v.t. |   ja   |     nee     |     nee     |   nee  |   nee  |   nee  |
| SW1      |   ja   |   ja   | n.v.t. |     nee     |     nee     |   nee  |   nee  |   nee  |
| SW2      |   nee  |   nee  |  nee   |     nee     |     nee     | n.v.t. |   ja   |   ja   |
| PC3      |   nee  |   nee  |  nee   |     nee     |     nee     |   ja   | n.v.t. |   ja   |
| PC4      |   nee  |   nee  |  nee   |     nee     |     nee     |   ja   |   ja   | n.v.t. |

### Configuratie router

#### IPv4

| Van/naar | PC1    | PC2    | SW1    | R1 (G0/0/0) | R2 (G0/0/1) | SW2    | PC3    | PC4    |
| -------- | ------ | ------ | ------ | ----------- | ----------- | ------ | ------ | ------ |
| PC1      | n.v.t. |        |        |             |             |        |        |        |
| PC2      |        | n.v.t. |        |             |             |        |        |        |
| SW1      |        |        | n.v.t. |             |             |        |        |        |
| R1       |        |        |        | n.v.t.      | n.v.t.      |        |        |        |
| SW2      |        |        |        |             |             | n.v.t. |        |        |
| PC3      |        |        |        |             |             |        | n.v.t. |        |
| PC4      |        |        |        |             |             |        |        | n.v.t. |

#### IPv6

| Van/naar | PC1    | PC2    | SW1    | R1 (G0/0/0) | R2 (G0/0/1) | SW2    | PC3    | PC4    |
| -------- | ------ | ------ | ------ | ----------- | ----------- | ------ | ------ | ------ |
| PC1      | n.v.t. |        |        |             |             |        |        |        |
| PC2      |        | n.v.t. |        |             |             |        |        |        |
| SW1      |        |        | n.v.t. |             |             |        |        |        |
| R1       |        |        |        | n.v.t.      | n.v.t.      |        |        |        |
| SW2      |        |        |        |             |             | n.v.t. |        |        |
| PC3      |        |        |        |             |             |        | n.v.t. |        |
| PC4      |        |        |        |             |             |        |        | n.v.t. |

### Instellen SSH-toegang

| Van/naar | SW1 | R1 (G0/0/0) | R1 (G0/0/1) | SW2 |
| -------- | --- | ----------- | ----------- | --- |
| PC1      |     |             |             |     |
| PC3      |     |             |             |     |

## Evaluatiecriteria

- [ ] Je hebt een correct adresseringsschema voor IPv4 uitgewerkt en kan dit toelichten.
- [ ] Je hebt een correct adresseringsschema voor IPv6 uitgewerkt en kan dit toelichten.
- [ ] PC1 kan pingen naar SW1, R1, SW2 en PC4 over IPv4.
- [ ] PC1 kan pingen naar PC4 over IPv6.
- [ ] De begeleider selecteert willekeurig een van volgende toestellen: SW1, R1, SW2. Je kan op dit toestel het volgende demonstreren:
  - [ ] Je kan inloggen via de consolekabel.
  - [ ] Er is een wachtwoord ingesteld voor console en privileged EXEC mode.
  - [ ] Er is een MOTD ingesteld.
  - [ ] Wachtwoorden staan geëncrypteerd in de running config.
  - [ ] Er zijn geen ongewenste DNS lookups.
  - [ ] De startup config is weggeschreven.
  - [ ] Je kan via IPv4 pingen naar zowel SW1, R1, SW2.
- [ ] Je kan vanuit PC1 een SSH-verbinding openen naar SW1 en R1 via IPv4.
- [ ] Je hebt een verslag gemaakt op basis van het template.
- [ ] De cheat sheet werd aangevuld met nuttige commando's die je wenst te onthouden voor later.

## Problemen en oplossingen

Beschrijf hieronder eventuele problemen die jullie zijn tegengekomen tijdens het uitvoeren van de opdracht, met een korte beschrijving van wat er mis ging en hoe jullie het hebben opgelost (als het jullie gelukt is om het op te lossen). Als het niet gelukt is om het op te lossen, beschrijf dan hoe ver jullie zijn gekomen en wat jullie tegenhield om verder te gaan. Voeg eventuele foutmeldingen, screenshots, enz. toe.

Als jullie geen problemen zijn tegengekomen, schrijf dan "geen problemen ondervonden".

### Probleem 1 - Korte beschrijving van het probleem

Beschrijf hier het probleem uitgebreid met screenshots, code snippets, enz. en de oplossing die jullie al dan niet hebben gevonden.

## Voorbereiding demo

Beschrijf hier hoe je elk evaluatiecriterium zal demonstreren. Geef ook aan welke bestanden, commando's, enz. je zal gebruiken tijdens de demo.

## Reflecties

Wat was moeilijk? Wat was eenvoudig? Wat hebben jullie geleerd van de opdracht? Wat zouden jullie anders doen als jullie het opnieuw moesten doen?

Als jullie nog andere opmerkingen hebben over de opdracht hebben, voel je vrij om ze te delen.

## Bronnen

Maak een lijst van alle bronnen die jullie hebben gebruikt tijdens het uitvoeren van de opdracht: boeken, handleidingen, HOWTO's, blog posts, enz.

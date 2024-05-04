# Verslag: SUBJECT

> Naam verslaggever: Keanu Vervaeke

## Beschrijving

Het opzetten van een netwerk in packet tracer en ook zelf de ip adressen toewijzen. Het netwerk werd in 2 subnets opgesplitst en met de configuratie van alle toestellen in het netwerk moet er een connectie mogelijk zijn tussen alle toestellen.

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
| PC1      | n.v.t. |   ja   |  ja    |     ja      |     ja      |   ja   |   ja   |   ja   |
| PC2      |   ja   | n.v.t. |  ja    |     ja      |     ja      |   ja   |   ja   |   ja   |
| SW1      |   ja   |   ja   | n.v.t. |     ja      |     ja      |   ja   |   ja   |   ja   |
| R1       |   ja   |   ja   |  ja    | n.v.t.      | n.v.t.      |   ja   |   ja   |   ja   |
| SW2      |   ja   |   ja   |  ja    |     ja      |     ja      | n.v.t. |   ja   |   ja   |
| PC3      |   ja   |   ja   |  ja    |     ja      |     ja      |   ja   | n.v.t. |   ja   |
| PC4      |   ja   |   ja   |  ja    |     ja      |     ja      |   ja   |   ja   | n.v.t. |

#### IPv6

| Van/naar | PC1    | PC2    | SW1    | R1 (G0/0/0) | R2 (G0/0/1) | SW2    | PC3    | PC4    |
| -------- | ------ | ------ | ------ | ----------- | ----------- | ------ | ------ | ------ |
| PC1      | n.v.t. |   ja   |  ja    |     ja      |     ja      |   ja   |   ja   |   ja   |
| PC2      |   ja   | n.v.t. |  ja    |     ja      |     ja      |   ja   |   ja   |   ja   |
| SW1      |   ja   |   ja   | n.v.t. |     ja      |     ja      |   ja   |   ja   |   ja   |
| R1       |   ja   |   ja   |  ja    | n.v.t.      | n.v.t.      |   ja   |   ja   |   ja   |
| SW2      |   ja   |   ja   |  ja    |     ja      |     ja      | n.v.t. |   ja   |   ja   |
| PC3      |   ja   |   ja   |  ja    |     ja      |     ja      |   ja   | n.v.t. |   ja   |
| PC4      |   ja   |   ja   |  ja    |     ja      |     ja      |   ja   |   ja   | n.v.t. |

### Instellen SSH-toegang

| Van/naar | SW1 | R1 (G0/0/0) | R1 (G0/0/1) | SW2 |
| -------- | --- | ----------- | ----------- | --- |
| PC1      |     |             |             |     |
| PC3      |     |             |             |     |

## Evaluatiecriteria

- [x] Je hebt een correct adresseringsschema voor IPv4 uitgewerkt en kan dit toelichten.
- [x] Je hebt een correct adresseringsschema voor IPv6 uitgewerkt en kan dit toelichten.
- [x] PC1 kan pingen naar SW1, R1, SW2 en PC4 over IPv4.
- [x] PC1 kan pingen naar PC4 over IPv6.
- [x] De begeleider selecteert willekeurig een van volgende toestellen: SW1, R1, SW2. Je kan op dit toestel het volgende demonstreren:
  - [x] Je kan inloggen via de consolekabel.
  - [x] Er is een wachtwoord ingesteld voor console en privileged EXEC mode.
  - [x] Er is een MOTD ingesteld.
  - [x] Wachtwoorden staan geëncrypteerd in de running config.
  - [x  Er zijn geen ongewenste DNS lookups.
  - [x] De startup config is weggeschreven.
  - [x] Je kan via IPv4 pingen naar zowel SW1, R1, SW2.
- [ ] Je kan vanuit PC1 een SSH-verbinding openen naar SW1 en R1 via IPv4.
- [ ] Je hebt een verslag gemaakt op basis van het template.
- [ ] De cheat sheet werd aangevuld met nuttige commando's die je wenst te onthouden voor later.

## Problemen en oplossingen

Geen problemen ondervonden.

## Voorbereiding demo

Beschrijf hier hoe je elk evaluatiecriterium zal demonstreren. Geef ook aan welke bestanden, commando's, enz. je zal gebruiken tijdens de demo.

## Reflecties

De opdracht was vrij voor de hand liggend, maar toch wel redelijk wat werk. Voor mij werkte alles van de eerste keer, geen problemen ondervonden.

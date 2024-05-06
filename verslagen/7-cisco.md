# Verslag: Cisco Packt Tracer

> Naam verslaggever: Keanu Vervaeke

## Beschrijving

Het opzetten van een netwerk in packet tracer en ook zelf de ip adressen toewijzen. Het netwerk werd in 2 subnetten opgesplitst en met de configuratie van alle toestellen in het netwerk moet er een connectie zijn tussen de computers, swithces en router. Als laatste wordt een ssh-toegang ingesteld.

## Antwoorden op de vragen in de opdracht

**Hoe toon je de huidige configuratie?**
```bash 
show running-config
```

**Hoe toon je de IOS-versie?**

```bash
show version | include IOS
```

**Hoe toon je een overzicht van de interfaces (IPv4 en IPv6)?**

```bash
show ip/ipv6 interface brief
```

**Waarom heeft Vlan1 2 IPv6-adressen?**

Omdat er een link-local adres is en een global unicast adres. Het link-local adres wordt automatisch gegenereerd op basis van het MAC-adres, het global unicast adres werd handmatig geconfigureerd. Het link-local adres wordt gebruikt voor communicatie binnen hetzelfde lokale netwerksegment. Dit adres wordt niet buiten het lokale netwerksegment gerouteerd en heeft dus geen betekenis buiten dat lokaal netwerk. Een global unicast adres wordt gebruikt voor globale communicatie over het hele ipv6-internet. In dit geval wordt het dus gebruikt voor ipv6-communicatie buiten het lokale netwerksegment.

**Waarom geeft de eerste ping soms een Request timed out. foutmelding terwijl de volgende drie wel lukken?**

Omdat de default timeout de Cisco router 5 seconden is. Pingen binnen eenzelfde subnet is dus geen probleem want er is geen tussenkomst van een router en het duurt minder lang dan 5 seconden. Echter, wanneer er een ping-verzoek uitgevoerd wordt naar een apperaat in een ander subnet moet dit via de router. De router moet mogelijk het ARP-proces doorlopen om het MAC-adres van het doelapparaat te bepalen. Dit kan gebeuren tijdens de eerste ping en daarom gaat deze soms verloren.

**Hoe toon je de routeringstabel**

```bash
show ip/ipv6 route
```

**Hoeveel routes zijn aangeduid met C? Wat betekent dit?**

Er zijn 2 routes aangeduid met C. Dit zijn de routes die rechtstreek verbonden zijn met de interface van de router. Het aantal omvat dus hoeveel subnetten een waarmee de router rechtstreeks in verbinding staat.

**Hoeveel routes zijn aangeduid met L? Wat betekent dit?**

Er zijn 2 routes aangeduid met L. Deze routes representeren de IP-adressen van de interfaces van de router zelf. Ze worden automatisch gegenereerd door het routeringsproces en worden gebruikt om het IP-adres van de router aan te geven als een bestemming in de routingtabel.

**Hoe kan je de IP-adressen van de interfaces zien (IPv4 en IPv6) en welke interfaces up of down zijn?**

```bash
show interfaces
```

**Hoe kan je de MAC-adressen terugvinden van de interfaces?**

```bash
show interfaces
```

**Een default gateway hoeft niet geconfigureerd te worden op een router. Waarom niet? Wanneer zou je in de plaats hiervan wel een default route configureren?**

Een default gateway hoeft niet expliciet geconfigureerd te worden op een router omdat routers van nature weten hoe ze pakketten moeten doorsturen naar onbekende bestemmingen. Het configureren van een default route kan belangrijk zijn om connectiviteit met externe netwerken mogelijk te maken of om specifieke routeringsvereisten te vervullen.

**Wat is de "SSH timeout" en "maximum authentication retries"? Hoe stel ik deze in op 60 seconden en 3 retries?**

De SSH timeout verwijst naar de maximale tijd dat een SSH-sessie open blijft voordat deze wordt verbroken vanwege inactiviteit. De maximum authentication retries verwijst naar het aantal keren dat een gebruiker mag proberen om succesvol in te loggen voordat de verbinding wordt verbroken. Om deze in te stellen op 60 seconden en 3 retries gebruik je volgende code:

```bash
configure terminal
ip ssh time-out 60
ip ssh authentication-retries 3
```

**Activeer SSH op de VTY lines, maar geen telnet. Waarom schakelen we telnet uit?**

Telnet is een verouderd protocol en wordt niet meer gebruikt omdat het alle gegevens, inclusief inloggegevens en vertrouwelijke informatie, onversleuteld over het netwerk verzendt. SSH daarentegen biedt ssh versleutelde communicatie tussen de client en de server.

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
| PC1      |  ja |     ja      |     ja      |  ja |
| PC3      |  ja |     ja      |     ja      |  ja |

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
  - [x] Er zijn geen ongewenste DNS lookups.
  - [x] De startup config is weggeschreven.
  - [x] Je kan via IPv4 pingen naar zowel SW1, R1, SW2.
- [x] Je kan vanuit PC1 een SSH-verbinding openen naar SW1 en R1 via IPv4.
- [x] Je hebt een verslag gemaakt op basis van het template.
- [x] De cheat sheet werd aangevuld met nuttige commando's die je wenst te onthouden voor later.

## Problemen en oplossingen

Geen problemen ondervonden.

## Voorbereiding demo

### Je hebt een correct adresseringsschema voor IPv4 uitgewerkt en kan dit toelichten.
Zie schema boven.
### Je hebt een correct adresseringsschema voor IPv6 uitgewerkt en kan dit toelichten.
Zie schema boven.
### PC1 kan pingen naar SW1, R1, SW2 en PC4 over IPv4.
Open de cmd van PC1 en type telkens "ping [ip-adres apparaat]".
### PC1 kan pingen naar PC4 over IPv6.
Open de cmd van PC1 en type "ping fd5c:32f3:9ce9:2::0011".
### Je kan inloggen via de consolekabel.
Connecteer het aangegeven apparaat met een consolekabel, ga naar de CLI en druk op enter.
### Er is een wachtwoord ingesteld voor console en privileged EXEC mode.
In de CLI van een switch of de router druk enter en voer het passwoord in. Type vervolgens "enable" en voer het passwoord in.
### Er is een MOTD ingesteld.
Deze is zichtbaar als je het passwoord moet ingeven en kan ook teruggevonden worden in de running-config file.
### Wachtwoorden staan geëncrypteerd in de running config.
Type "show running-config" in de CLI.
### De startup config is weggeschreven.
Type "show startup-config" in de CLI.
### Je kan via IPv4 pingen naar zowel SW1, R1, SW2.
Type telkens "ping [ip-adres apparaat]" in de CLI.
### Je kan vanuit PC1 een SSH-verbinding openen naar SW1 en R1 via IPv4.
Open cmd van PC1 en type "ssh -l [naam] [Ip-adres apparaat]" en geef dan het passwoord in.


## Reflecties

De opdracht was vrij voor de hand liggend, maar toch wel redelijk wat werk. Voor mij werkte alles van de eerste keer, geen problemen ondervonden.

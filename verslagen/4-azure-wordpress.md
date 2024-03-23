# Verslag 4: WordPress opzetten in de Microsoft Azure cloudomgeving

> Naam verslaggever: Emiel Vandenberghe

## :speech_balloon: Beschrijving

n deze opdracht zal je proeven van de mogelijkheden binnen de Microsoft Azure cloudomgeving. Je zal hiervoor een account maken op Azure, een applicatie- en databankserver opzetten en de WordPress webapplicatie installeren en configureren. Uiteraard zorg je ervoor dat de verbindingen tussen de systemen en met de webapplicatie veilig verlopen.

## :thinking: Antwoorden op de vragen in de opdracht

**In de configuratiemap van Apache is er nog een map /etc/apache2/sites-enabled Wat is verschil tussen beide?**

- Het verschil tussen de twee mappen is dat `sites-available` alle mogelijke opties bevat, terwijl `sites-enabled `alleen de actieve configuraties bevat die Apache daadwerkelijk gebruikt. Dit maakt het gemakkelijk om verschillende websites in- en uit te schakelen zonder de configuratiebestanden te hoeven verwijderen of hernoemen.

## :memo: Evaluatiecriteria

- [x] Je kan de aangemaakte machines tonen in de Azure omgeving.
- [x] Het lukt om een SSH-verbinding op te zetten met de applicatieserver.
- [x] Het lukt om aan te melden op MySQL op de databankserver vanaf de applicatieserver.
- [x] Je kan met HTTPS surfen naar jouw WordPress blog.
- [x] Je kan kan aanmelden en het WordPress dashboard tonen.
- [x] Je kan een nieuw bericht posten op jouw WordPress blog.
- [x] Je hebt een verslag gemaakt op basis van het template.
- [x] De cheat sheet werd aangevuld met nuttige commando's die je wenst te onthouden voor later.

## :information_desk_person: Voorbereiding demo

Beschrijf hier hoe je elk evaluatiecriterium zal demonstreren. Geef ook aan welke bestanden, commando's, enz. je zal gebruiken tijdens de demo.

## Je kan de aangemaakte machines tonen in de Azure omgeving.

- Surf naar https://portal.azure.com/#home
    - Navigaar naar all resources
    - Toon de VM en de Azure database

| ![Screenshot Webbrowser](./img/4-azure-wordpress/foto1.png) |
| :------------------------------------------------------------------------------: |
|                Figuur 1. Aantonen aangemaakte machines in Azure           |

## Het lukt om een SSH-verbinding op te zetten met de applicatieserver.

- Navigeer naar de virtuele machine op azure
    - Kopieer de DNS name
    - Open je command prompt op windows en voer `ssh <gebruikersnaam>@<dns naam> ` in
    - Geef vervolgens dan het wachtwoord in dat je bijhield op je cheatcheet

| ![Screenshot Webbrowser](./img/4-azure-wordpress/Screenshot%202024-03-23%20135012.png) |
| :------------------------------------------------------------------------------: |
|                Figuur 2. DNS naam zoeken en kopieren           |

| ![Screenshot Command prompt](./img/4-azure-wordpress/Screenshot%202024-03-23%20135200.png) |
| :------------------------------------------------------------------------------: |
|                Figuur 3. Aantonen succesvolle SSH verbinding           |

## Het lukt om aan te melden op MySQL op de databankserver vanaf de applicatieserver.

- Open de reeds gemaakt SSH verbinding met de applicatieserver
- Haal eerst de laatste informatie van de package repositories op met `sudo apt update `
- Voer de updates uit ` sudo apt upgrade `
- Installeer MySQL client met ` sudo apt install mysq-client`

| ![Screenshot Webbrowser](./img/4-azure-wordpress/Screenshot%202024-03-23%20140414.png) |
| :------------------------------------------------------------------------------: |
|                Figuur 4. command prompt voorbereiden op mysql           |
- Verbind met Mysql databankserver met ` mysql -h <host> -u <user> -p
    - Navigeer voor de gegevens naar de databankserver op Azure
    - Als je hier een error krijgt zal je eerst de instellingen van de firewall moeten aanpassen op Azure. Je moet hier je IP adres goed zetten.

| ![Screenshot Webbrowser](./img/4-azure-wordpress/Screenshot%202024-03-23%20140725.png) |
| :------------------------------------------------------------------------------: |
|                Figuur 5. Met de databankserver verbinden          |


## Je kan met HTTPS surfen naar jouw WordPress blog.

- Je configureerd word press volgens de stappen.
- Surf naar je dns naam op een browser


| ![Screenshot Webbrowser](./img/4-azure-wordpress/localhost.png) |
| :------------------------------------------------------------------------------: |
|                Figuur 6. Succesvolle connectie met Wordpress          |

- Als je je certificaat correct hebt aangevraagd zou je ook dit moeten krijgen

| ![Screenshot Webbrowser](./img/4-azure-wordpress/Screenshot%202024-03-23%20142148.png) |
| :------------------------------------------------------------------------------: |
|                Figuur 7. Succesvol aangemaakte certificaat          |


## Mogelijke uitbreidingen


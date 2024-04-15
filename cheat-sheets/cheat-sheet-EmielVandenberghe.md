# Cheat sheets en checklists

> Student: Emiel Vandenberghe

## Chocolatey

| Taak                                                                                 | Commando                         |
| :----------------------------------------------------------------------------------- | :------------------------------- |
| Een lijst tonen van de software die nu geinstalleerd is via Chocolatey               | `choco list`                     |
| Overzicht van alle opties bruikbaar met het commando _choco_                         | `choco -?`                       |
| Alle geinstalleerde packages bijwerken naar hun laatst beschikbare versie            | `choco upgrade all`              |
| Applicatie installeren (gebruik -y zodat er geen bevestiging wordt gevraagd)         | `choco install -y <packagenaam>` |
| [package naam van een applicatie zoeken](https://community.chocolatey.org/packages/) | /                                |
| Via de console een package opzoeken                                                  | `choco search <packagename>`     |
| Een geinstalleerde applicatie verwijderen                                            | `choco uninstall <packagename>`  |

## Markdown

| Taak                              | Commando                                              |
| :-------------------------------- | :---------------------------------------------------- |
| Woord in het vet zetten           | `** ... **`                                           |
| Woord schuin zetten               | `* ... *`                                             |
| Hoofding (hoe meer # hoe kleiner) | `# hoofding1 ## hooding2 ### hoofding3 ... `          |
| Een hyperlink plaatsen            | `[tekst die je wilt tonen](link)`                     |
| Een foto plaatsen                 | `![een beschrijving van de foto](link naar de foto) ` |

## Poweshell ISE

| Taak                                          | Commando       |
| :-------------------------------------------- | :------------- |
| Testen of je kan verbinden met een applicatie | `ping <adres>` |
| Script runnen                                 | `F5`           |

## Linux

| Taak                                          | Commando                              |
| :-------------------------------------------- | :------------------------------------ |
| Een service opnieuw opstarten                 | `sudo systemctl restart <packagename` |
| Alle netwerkpoorten die in gebruik zijn tonen | `sudo ss -tlnp`                       |
| Controleren of de service draait              | `systemctl status <packagename>`      |
| een applicatie installeren                    | `sudo apt install -y <packagenaam>`   |
| Virtuele machine afsluiten                    | `sudo poweroff`                       |
| Een geïnstalleerde applicatie verwijderen     | `sudo apt remove <package_name>`      |
| Alle netwerk configuraties tonen              | `ip a`                                |

### Databank configureren in Linux

| Task                                              | Command                                                                                      |
| :------------------------------------------------ | :------------------------------------------------------------------------------------------- |
| SQL databank starten als root (zonder wachtwoord) | `sudo mysql`                                                                                 |
| SQL databank starten als root (met wachtwoord)    | `sudo mysql -u root -p`                                                                      |
| SQL databank gebruiken                            | `use mysql`                                                                                  |
| SQL databank afsluiten                            | `exit;`                                                                                      |
| De root configureren                              | `mysql alter user 'root'@'localhost' identified with mysql_native_password by '<password>';` |
| Een admin configureren                            | `create user 'admin'@'%' identified by '<password>';`                                        |
| Alle rechten aan een admin geven                  | `grant all privileges on *.* to 'admin'@'%' with grant option;`                              |
| Alle rechten van alle gebruikers updaten          | `flush privileges;`                                                                          |
| De beveiligingsopties van een databank instellen  | `sudo mysql_secure_installation`                                                             |

## MySQL Workbench

| Taak                                                      | Commando                                               |
| :-------------------------------------------------------- | :----------------------------------------------------- |
| een user aanmaken/configureren                            | `create user '<naam>'@'%' identified by '<password>';` |
| alle rechten behalve WITH GRANT OPTION aan een user geven | `grant all privileges on *.* to '<user>'@'%'; `        |
| De rechten effectief toekennen/updaten                    | `flush privileges`                                     |

## Een webserver opzetten in linux

| Taak                                                                          | Commando                                                                                                |
| :---------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------ |
| kijken welke netwerkpoort gebruikt wordt voor hhtps                           | `grep 'https' /etc/services`                                                                            |
| ervoor zorgen dat fqil2ban start bij opstart vm                               | `sudo systemctl start fail2ban`                                                                         |
| ervoor zorgen dat fail2ban 'aan' staat                                        | `sudo systemctl enable fail2ban`                                                                        |
| Controleren of de apache server draait                                        | `sudo systemctl status apache2`                                                                         |
| Alle welke netwerkpoort apache2 gebruikt tonen                                | `sudo ss -tlnp`                                                                                         |
| status van de firewall bekijken                                               | `sudo ufw status`                                                                                       |
| firewall activeren voor een bepaalde service                                  | `sudo ufw allow [poortnummer_programma] `                                                               |
| de firewall actief/inactief stellen                                           | ` sudo ufw enable/disable`                                                                              |
| zien welke jails geconfigureerd zijn                                          | `sudo fail2ban-client status`                                                                           |
| zien welke IP adressen geblokkeerd zijn                                       | `sudo fail2ban-client status [naam] (hier sshd)`                                                        |
| opvragen findtime, maxentry, bantime                                          | `sudo fail2ban-client get [jailname] findtime/maxentry/bantime`                                         |
| je IP-adres terug vrijmaken zonder te wachten tot de blokkeertijd verlopen is | `sudo fail2ban-client set <jail-naam> unbanip <ip-adres>`                                               |
| een adres whitelisten                                                         | `/etc/fail2ban/jail.local openen in nano,  ignoreip = 127.0.0.1/8 192.168.56.30 toevoegen op het einde` |
| wijzigingen fail2ban toepassen                                                | `sudo systemctl restart fail2ban`                                                                       |

## Azure Wordpress wachtwoorden en gebruikersnamen.

| **Variabele**                             | **Inhoud**                                                                                                                |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Resourcegroep                             | SELabs-Wordpress                                                                                                          |
| Naam databankserver                       | evdb-wordpressdb                                                                                                          |
| DNS-naam databankserver                   | bv. "or-wordpressdb.mysql.database.azure.com"<br />(terug te vinden op de overzichtspagina van de machine in Azure)       |
| Beheerder databankserver                  | wordpressdb                                                                                                               |
| Wachtwoord databankserver                 | LetmeIn!                                                                                                                  |
| Naam applicatieserver (Ubuntu)            | evdb-wordpressubu                                                                                                         |
| Naam applicatieserverAdmin (Ubuntu)       | evdb                                                                                                                      |
| Wachtwoord applicatieserverAdmin (Ubuntu) | LetAdminInNow!                                                                                                            |
| DNS-naam applicatieserver                 | bv. "or-wordpressapp.westeurope.cloudapp.azure.com"<br />(terug te vinden op de overzichtspagina van de machine in Azure) |
| Gebruikersnaam applicatieserver           | wordpressapp                                                                                                              |
| Wachtwoord applicatieserver               | LetmeIntheApp!                                                                                                            |
| WordPress db user                         | wordpress                                                                                                                 |
| Wachtwoord van WordPress db user          | wordpresspwd                                                                                                              |
| WordPress user                            | emielio                                                                                                                   |
| WordPress user password                   | UutEO8vc1SPO@l#QRl (gegenereerd)                                                                                          |

### Docker

| Task                                      | Command                                             |
| :---------------------------------------- | :-------------------------------------------------- |
| Lijst van containers die runnen           | `docker ps`                                         |
| Lijst van alle containers                 | `docker ps -a`                                      |
| Container starten                         | `docker run <image>`                                |
| Container stoppen                         | `docker stop <image>`                               |
| Container verwijderen (na die gestopt is) | `docker rm <container_id>`                          |
| Volume maken                              | `docker volume create <volume_name>`                |
| Een volume aan een container binden       | `docker run -v <volume_name>:<pad_naar_dockerfile>` |
| Een docker compose starten                | `docker compose up -d`                              |
| Een docker compose stoppen                | `docker compose down`                               |
| Docker opruimen                           | `docker system prune --all --volumes`               |

## Portainer

| Task                 | Command                  |
| :------------------- | :----------------------- |
| gebruikersnaam       | `admin`                  |
| wachtwoord           | `+ksEHp=4%"vvJ4F`        |
| portainer in browser | `https://localhost:9443` |

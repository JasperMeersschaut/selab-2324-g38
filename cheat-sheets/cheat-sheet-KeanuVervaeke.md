# Cheat sheets en checklists

> Student: Keanu Vervaeke

## Cheat sheets

### PowerShell

| Task                          | Command      |
| :---------------------------- | :----------- |
| Commentaarregel schrijven     | `#`          |
| Tekst afdrukken op de console | `Write-Host` |
| Script runnen                 | `Fn + F5`    |

### Chocolatey package manager

| Task                                                                                                       | Command                          |
| :--------------------------------------------------------------------------------------------------------- | :------------------------------- |
| Overzicht van alle opties en parameters bruikbaar met het commando **choco**                               | `choco -?`                       |
| Applicatie installeren ([Packagename van applicatie opzoeken](https://community.chocolatey.org/packages/)) | `choco install -y <packagename>` |
| Een lijst tonen van de software die nu geïnstalleerd is via apt                                            | `choco list`                     |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie                                    | `choco upgrade all`              |
| Via de console een package opzoeken                                                                        | `choco search <packagename>`     |
| Een geïnstalleerde applicatie verwijderen                                                                  | `choco uninstall <packagename>`  |

### Linux

| Task                                                                    | Command                                |
| :---------------------------------------------------------------------- | :------------------------------------- |
| Applicatie installeren                                                  | `sudo apt install -y <packagename>`    |
| Lijst van software die nu geïnstalleerd is                              | `sudo apt list --Installed`            |
| Via de console een package opzoeken                                     | `sudo apt search <packagename>`        |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie | `sudo apt upgrade all`                 |
| Alle netwerk configuraties tonen                                        | `ip a`                                 |
| Een geïnstalleerde applicatie verwijderen                               | `sudo apt remove <packagename>`        |
| Controleren of de service draait                                        | `systemctl status <packagename>`       |
| Een service opnieuw opstarten                                           | `sudo systemctl restart <packagename>` |
| Alle netwerkpoorten die in gebruik zijn tonen                           | `sudo ss -tlnp`                        |
| Machine afsluiten                                                       | `sudo poweroff`                        |

### Databank configuratie

| Task                                              | Command                                                                                      |
| :------------------------------------------------ | :------------------------------------------------------------------------------------------- |
| SQL databank starten als root (zonder wachtwoord) | `sudo mysql`                                                                                 |
| SQL databank starten als root (met wachtwoord)    | `sudo mysql -u root -p`                                                                      |
| De root configureren                              | `mysql alter user 'root'@'localhost' identified with mysql_native_password by '<password>';` |
| Een admin configureren                            | `create user 'admin'@'%' identified by '<password>';`                                        |
| Rechten aan een admin geven                       | `grant all privileges on *.* to 'admin'@'%' with grant option;`                              |
| Rechten van alle gebruikers updaten               | `flush privileges;`                                                                          |
| De beveiligingsopties van een databank instellen  | `sudo mysql_secure_installation`                                                             |
| SQL databank gebruiken                            | `use mysql`                                                                                  |
| SQL databank afsluiten                            | `exit;`                                                                                      |

### Apache

| Task                                                                        | Command                                                                      |
| :-------------------------------------------------------------------------- | :--------------------------------------------------------------------------- |
| Apache root map                                                             | `/var/www/html`                                                              |
| Zorgen dat mensen met de Apache-server kunnen verbinden met SSL/TLs (https) | `sudo a2enmod ssl; sudo a2ensite default-ssl; sudo systemctl reload apache2` |

### Firewall

| Task                                                                                         | Command                                             |
| :------------------------------------------------------------------------------------------- | :-------------------------------------------------- |
| Firewall aanzetten                                                                           | `sudo ufw enable`                                   |
| Verkeer toelaten op bepaalde poort                                                           | `sudo ufw allow <port_number>`                      |
| Tonen op welke poorten verkeer toegestaan is                                                 | `sudo ufw status`                                   |
| Tonen welke jails geconfigureerd zijn                                                        | `sudo fail2ban-client status`                       |
| Tonen welke IP-adressen geblokkeerd zijn                                                     | `sudo fail2ban-client status <jail_name>`           |
| De findtime tonen                                                                            | `sudo fail2ban-client get <jail_name> findtime`     |
| De maxretry tonen                                                                            | `sudo fail2ban-client get <jail_name> maxretry`     |
| De bantime tonen                                                                             | `sudo fail2ban-client get <jail_name> bantime`      |
| IP-adres unbannen                                                                            | `sudo fail2ban-client set <jail_name> unbanip <ip>` |

### Hydra

| Task                                                   | Command                                                                       |
| :----------------------------------------------------- | :---------------------------------------------------------------------------- |
| Brute-force een passwoord met een gekende username     | `hydra -l <username> -P <path to wordlist> <IP> ssh`                          |
| Brute-force een username met een gekend passwoord      | `hydra -L <path to wordlist> -p <password> <IP> ssh`                          |
| Brute-force zonder passwoord of username te weten      | `hydra -L <path to username wordlist> -P <path to password wordlist> <IP> ssh`|


### Overzicht machinenamen, accounts en wachtwoorden

| **Variabele**                    | **Inhoud**                                                                                                                |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Resourcegroep                    | SELabs-Wordpress                                                                                                          |
| Naam databankserver              | vk-wordpressdb                                                                                                            |
| DNS-naam databankserver          | vk-wordpressdb.mysql.database.azure.com                                                                                   |
| Beheerder databankserver         | wordpressdb                                                                                                               |
| Wachtwoord databankserver        | LetmeIn!                                                                                                                  |
| Naam applicatieserver (Ubuntu)   | vk-wordpressapp                                                                                                           |
| DNS-naam applicatieserver        | vk-wordpressapp.northeurope.cloudapp.azure.com                                                                            |
| Gebruikersnaam applicatieserver  | wordpressapp                                                                                                              |
| Wachtwoord applicatieserver      | LetmeIntheApp!                                                                                                            |
| WordPress db user                | wordpress                                                                                                                 |
| Wachtwoord van WordPress db user | wordpresspwd                                                                                                              |
| WordPress user                   | admin                                                                                                                     |
| WordPress user password          | dgLePdn86E($tFIfhE                                                                                                        |


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



### Cisco Packet Tracer 

| Task                                                   | Command                                             |
| :----------------------------------------------------- | :-------------------------------------------------- |
| Toegang krijgen tot privilege mode                     | `enable`                                            |
| Configuratiemodus openen                               | `configure terminal`                                |
| Een machine een naam geven                             | `hostname <naam>`                                   |
| DNS-lookups uitschakelen                               | `no ip domain-lookup`                               |
| Een wachtwoord instellen voor de privileged EXEC-modus | `enable secret <wachtwoord>`                        |
| Een wachtwoord instellen voor toegang tot de console   | `password <wachtwoord>`                             |
| Ervoor zorgen dat de wachtwoorden worden versleuteld   | `service password-encryption`                       |
| Een message of the day banner instellen                | `banner motd #message of the day#`                  |
| SVI-configuratiemodus openen                           | `interface vlan <vlan_nummer>`                      |
| Het IPv4-adres en subnetmasker instellen voor de SVI   | `ip address <IPv4_adres> <subnetmasker>`            |
| Het IPv6-adres instellen voor de SVI                   | `ipv6 address <IPv6_adres/64>`                      |
| De SVI (Switch Virtual Interface) inschakelen          | `no shutdown`                                       |
| Ipv4 default-gateway instellen                         | `ip default-gateway <IPv4_gateway_adres>`           |
| De configuratie tonen                                  | `show running-config`                               |
| De IOS-versie tonen                                    | `show version include IOS`                          |
| Een overzicht van interfaces tonen                     | `show ip/ipv6 interface brief`                      |
| Configuratiemodus verlaten                             | `exit`                                              |
| Wijzigingen opslaan                                    | `copy running-config startup-config`                |


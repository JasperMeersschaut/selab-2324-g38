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


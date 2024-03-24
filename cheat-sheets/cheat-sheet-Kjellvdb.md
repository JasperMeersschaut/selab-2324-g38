# Cheat sheets en checklists

> Student: Kjell Van Den Bossche ([Kjellvdb](https://github.com/Kjellvdb))

## Cheat sheets

### PowerShell ISE | PowerShell Terminal

| Task                                          | Command                     |
| :-------------------------------------------- | :-------------------------- |
| Commentaarregel schrijven                     | `#`                         |
| Tekst afdrukken op de console                 | `Write-Host`                |
| Script runnen                                 | `Fn + F5`                   |
| Textkleur aanpassen                           | `-ForegroundColor <Color>`  |
| achtergrondkleur aanpassen                    | ` -BackgroundColor <Color>` |
| Testen of je kan verbinden met een applicatie | `ping <adres>`              |

### Chocolatey package manager

| Task                                                                                                       | Command                          |
| :--------------------------------------------------------------------------------------------------------- | :------------------------------- |
| Overzicht van alle opties en parameters bruikbaar met het commando **choco**                               | `choco -?`                       |
| Applicatie installeren ([Packagename van applicatie opzoeken](https://community.chocolatey.org/packages/)) | `choco install -y <packagename>` |
| Een lijst tonen van de software die nu geïnstalleerd is                                                    | `choco list`                     |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie                                    | `choco upgrade all`              |
| Een package opzoeken                                                                                       | `choco search <packagename>`     |
| Een geïnstalleerde applicatie verwijderen                                                                  | `choco uninstall <packagename>`  |

### Linux

| Task                                                                    | Command                                   |
| :---------------------------------------------------------------------- | :---------------------------------------- |
| Machine afsluiten                                                       | `sudo poweroff`                           |
| Applicatie installeren                                                  | `sudo apt install -y <packagename>`       |
| Een lijst tonen van de software die nu geïnstalleerd is                 | `sudo apt list --installed`               |
| Van alle applicaties de laatste versie bijwerken                        | `sudo apt update`                         |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie | `sudo apt upgrade all`                    |
| Via de console een package opzoeken                                     | `sudo apt search <packagename>`           |
| Een geïnstalleerde applicatie verwijderen                               | `sudo apt remove <packagename>`           |
| Alle netwerk configuraties tonen                                        | `ip a`                                    |
| Controleren of de service draait                                        | `systemctl status <packagename>`          |
| Een service opnieuw opstarten                                           | `sudo systemctl restart <packagename>`    |
| Een applicatie laten opstarten bij opstarten Virtuele Machine           | `sudo systemctl enable <packagename>`     |
| Alle netwerkpoorten die in gebruik zijn tonen                           | `sudo ss -tlnp`                           |
| Een user lid maken van een groep                                        | `sudo usermod -aG <groep> <user>`         |
| Een document eigendom maken van een groep                               | `sudo chgrp -R <groep> <document>`        |
| Alle leden van een groep rechten geven tot een document                 | `sudo chmod -R g+<type_recht> <document>` |
| Een bestand lezen en aanpassen                                          | `sudo nano <bestand>`                     |

### MySQL

| Task                                                                 | Command                                                                                      |
| :------------------------------------------------------------------- | :------------------------------------------------------------------------------------------- |
| SQL databank starten als root (zonder wachtwoord)                    | `sudo mysql`                                                                                 |
| SQL databank starten als root (met wachtwoord)                       | `sudo mysql -u root -p`                                                                      |
| SQL databank gebruiken                                               | `use mysql`                                                                                  |
| De root configureren                                                 | `mysql alter user 'root'@'localhost' identified with mysql_native_password by '<password>';` |
| Een admin configureren                                               | `create user 'admin'@'%' identified by '<password>';`                                        |
| Alle rechten aan een admin geven                                     | `grant all privileges on *.* to 'admin'@'%' with grant option;`                              |
| Alle rechten van alle gebruikers updaten                             | `flush privileges;`                                                                          |
| SQL databank afsluiten                                               | `exit;`                                                                                      |
| De beveiligingsopties van een databank instellen (in linux terminal) | `sudo mysql_secure_installation`                                                             |
| Een database maken                                                   | `create database naam`                                                                       |
| Een user configureren                                                | `create user '<naam>'@'%' identified by '<password>';`                                       |
| Alle rechten (behalve `GRANT OPTION`) aan een user geven             | `grant all privileges on *.* to '<user>'@'%';`                                               |
| Alle rechten van alle gebruikers updaten                             | `flush privileges;`                                                                          |

### Apache

| Task                                                                        | Command                                        |
| :-------------------------------------------------------------------------- | :--------------------------------------------- |
| Apache root map                                                             | `/var/www/html`                                |
| Een site activeren                                                          | `sudo a2ensite <website>`                      |
| Apache toelaten om de URL te herschrijven                                   | `sudo a2enmod rewrite`                         |
| De default site uitzetten                                                   | `sudo a2dissite 000-default`                   |
| Zorgen dat mensen met de Apache-server kunnen verbinden met SSL/TLs (https) | `sudo a2enmod ssl; sudo a2ensite default-ssl;` |

### Linux Firewall

| Task                                                    | Command                                                    |
| :------------------------------------------------------ | :--------------------------------------------------------- |
| Firewall aanzetten                                      | `sudo ufw enable`                                          |
| Verkeer toelaten om een bepaalde applicatie te bereiken | `sudo ufw allow <poortnummer>`                             |
| Tonen op welke poorten verkeer toegelaten wordt         | `sudo ufw status`                                          |
| Tonen bij welke applicaties er connecties gebaned zijn  | `sudo fail2ban-client status`                              |
| Uitgebreide informatie over alle banned connecties      | `sudo fail2ban-client status <packagename>`                |
| De findtime van een applicatie tonen                    | `sudo fail2ban-client get <packagename> findtime`          |
| De maxretry van een applicatie tonen                    | `sudo fail2ban-client get <packagename> maxretry`          |
| De bantime van een applicatie tonen                     | `sudo fail2ban-client get <packagename> bantime`           |
| Een connectie unbannen                                  | `sudo fail2ban-client set <packagename> unbanip <ipadres>` |

### Hydra

| Task                                                   | Command                                                                                    |
| :----------------------------------------------------- | :----------------------------------------------------------------------------------------- |
| Wachtwoord kraken met een gegeven username en ip-adres | `hydra -l <username> -P /usr/share/wordlists/rockyou.txt 192.168.56.20 -t 4 ssh -V -e nsr` |

### Azure-WordPress machinenamen, accounts en wachtwoorden

| Variabele       | Inhoud                                                                 |
| --------------- | ---------------------------------------------------------------------- |
| Website         | http://kvdbwordpress.tech/                                             |
| Website         | https://kvdb-wordpressapp.francecentral.cloudapp.azure.com/            |
| Resourcegroep   | `SELabs-Wordpress`                                                     |
| Inloggen op app | `ssh wordpressapp@kvdb-wordpressapp.francecentral.cloudapp.azure.com`  |
| Inloggen op db  | `mysql -h kvdb-wordpressdb.mysql.database.azure.com -u wordpressdb -p` |

#### Databankserver

| Variabele                           | Inhoud                                      |
| ----------------------------------- | ------------------------------------------- |
| Naam databankserver                 | `kvdb-wordpressdb`                          |
| DNS databankserver                  | `kvdb-wordpressdb.mysql.database.azure.com` |
| Naam beheerder databankserver       | `wordpressdb`                               |
| Wachtwoord beheerder databankserver | `LetmeIn!`                                  |

#### Applicatieserver

| Variabele                       | Inhoud                                               |
| ------------------------------- | ---------------------------------------------------- |
| Naam applicatieserver (Ubuntu)  | `kvdb-wordpressapp`                                  |
| DNS applicatieserver            | `kvdb-wordpressapp.francecentral.cloudapp.azure.com` |
| Gebruikersnaam applicatieserver | `wordpressapp`                                       |
| Wachtwoord applicatieserver     | `LetmeIntheApp!`                                     |

#### WordPress

| Variabele                    | Inhoud               |
| ---------------------------- | -------------------- |
| WordPress db user            | `wordpress`          |
| WordPress db user wachtwoord | `wordpresspwd`       |
| WordPress user               | `admin`              |
| WordPress user password      | `Srro@H%E@1iKllIZUj` |

## Checklists

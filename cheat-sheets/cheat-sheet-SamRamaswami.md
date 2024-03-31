# Cheat sheets en checklists

> Student: Sam

## Chocolatey

| Task                                                                    | Command                                |
| :---------------------------------------------------------------------- | :------------------------------------- |
| Een lijst tonen van de software die nu geïnstalleerd is via Chocolatey  | `choco list`                           |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie | `choco upgrade all`                    |
| Via de console een package opzoeken                                     | `choco search <packagename> (--exact)` |
| Een geïnstalleerde applicatie verwijderen                               | `choco uninstall <packagename>`        |

## Linux

| Task                                                          | Command                                |
| :------------------------------------------------------------ | :------------------------------------- |
| Applicatie installeren                                        | `sudo apt install -y <packagename>`    |
| Informatie weergeven over de netwerkinterfaces op een systeem | `ip a`                                 |
| Controleren of een applicatie draait                          | `systemctl status <packagename>`       |
| Een applicatie opnieuw opstarten                              | `sudo systemctl restart <packagename>` |
| Actieve luisterende poorten tonen                             | `sudo ss -tlnp`                        |
| Machine afsluiten                                             | `sudo poweroff`                        |

### Configuratie MySQL

| Task                                                    | Command                                                                                      |
| :------------------------------------------------------ | :------------------------------------------------------------------------------------------- |
| SQL databank starten als root (zonder wachtwoord)       | `sudo mysql`                                                                                 |
| SQL databank starten als root (met wachtwoord)          | `sudo mysql -u root -p`                                                                      |
| SQL databank gebruiken                                  | `use mysql`                                                                                  |
| De root configureren                                    | `mysql alter user 'root'@'localhost' identified with mysql_native_password by '<password>';` |
| Een admin configureren                                  | `create user 'admin'@'%' identified by '<password>';`                                        |
| Alle rechten aan een admin geven (behalve grant option) | `grant all privileges on *.* to 'admin'@'%';`                                                |
| Alle rechten van alle gebruikers updaten                | `flush privileges;`                                                                          |
| De beveiligingsopties van een databank instellen        | `sudo mysql_secure_installation`                                                             |

### MySQL Workbench

| Task                                                     | Command                                                |
| :------------------------------------------------------- | :----------------------------------------------------- |
| Een database maken                                       | `create database naam`                                 |
| Een user configureren                                    | `create user '<naam>'@'%' identified by '<password>';` |
| Alle rechten (behalve `GRANT OPTION`) aan een user geven | `grant all privileges on *.* to '<user>'@'%';`         |
| Alle rechten van alle gebruikers updaten                 | `flush privileges;`                                    |

### Apache

| Task                                                                       | Command                                                                       |
| :------------------------------------------------------------------------- | :---------------------------------------------------------------------------- |
| Apache root map                                                            | `/var/www/html`                                                               |
| SSL module activeren van Apache zodat clients kunnen verbinden met SSL/TLs | `sudo a2enmod ssl; sudo a2ensite default-ssl; sudo systemctl reload apache2;` |

### Linux Firewall

| Task                                                                                         | Command                                             |
| :------------------------------------------------------------------------------------------- | :-------------------------------------------------- |
| Firewall aanzetten                                                                           | `sudo ufw enable`                                   |
| Verkeer toelaten om een bepaalde applicatie te bereiken                                      | `sudo ufw allow <port_number>`                      |
| Tonen op welke poorten verkeer toegelaten wordt                                              | `sudo ufw status`                                   |
| Tonen welke jails geconfigureerd zijn                                                        | `sudo fail2ban-client status`                       |
| Tonen welke IP-adressen geblokkeerd zijn                                                     | `sudo fail2ban-client status <jail_name>`           |
| De findtime van een jail tonen                                                               | `sudo fail2ban-client get <jail_name> findtime`     |
| De maxretry van een jail tonen                                                               | `sudo fail2ban-client get <jail_name> maxretry`     |
| De bantime van een jail tonen                                                                | `sudo fail2ban-client get <jail_name> bantime`      |
| IP-adres vrijmaken voordat blokkeertijd is verlopen                                          | `sudo fail2ban-client set <jail_name> unbanip <ip>` |
| Applicatie laten opstarten bij booten VM                                                     | `sudo systemctl enable <package_name>`              |
| Controleren of service opstart bij booten VM                                                 | `systemctl is-enabled <package_name>`               |
| Man page van jail.conf waar o.a. uitleg staat over de parameters findtime, maxretry, bantime | `man jail.conf`                                     |

### Shell

| Task                      | Command                     |
| :------------------------ | :-------------------------- |
| Verbinden met VM over SSH | `ssh osboxes@192.168.56.20` |

### Azure resourcegroep

Resourcegroep: `SELabs-Wordpress`

#### Azure commando's

| Task            | Command                                                                   |
| --------------- | ------------------------------------------------------------------------- |
| Inloggen op app | `ssh wordpressubuntu@ubuntu-sel-wordpress.northeurope.cloudapp.azure.com` |
| Inloggen op db  | `mysql -h sel-wordpress.mysql.database.azure.com -u wordpressdb -p`       |

### Databankserver namen en wachtwoorden

| Variabele                           | Inhoud                                   |
| ----------------------------------- | ---------------------------------------- |
| Naam databankserver                 | `sel-wordpress`                          |
| DNS databankserver                  | `sel-wordpress.mysql.database.azure.com` |
| Naam beheerder databankserver       | `wordpressdb`                            |
| Wachtwoord beheerder databankserver | `iqfuboeKQJDEIUBUOIPMLKJH783890`         |

### Applicatieserver namen en wachtwoorden

| Variabele                       | Inhoud                                                |
| ------------------------------- | ----------------------------------------------------- |
| Naam applicatieserver (Ubuntu)  | `ubuntu-sel-wordpress`                                |
| DNS applicatieserver            | `ubuntu-sel-wordpress.northeurope.cloudapp.azure.com` |
| Gebruikersnaam applicatieserver | `wordpressubuntu`                                     |
| Wachtwoord applicatieserver     | `IUdojkLSIOHUDIYsjkd3789203E`                         |

### WordPress namen en wachtwoorden

| Variabele                        | Inhoud                                                                     |
| -------------------------------- | -------------------------------------------------------------------------- |
| WordPress db user                | `wordpress`                                                                |
| Wachtwoord van WordPress db user | `wordpresspwd`                                                             |
| WordPress login scherm           | `https://ubuntu-sel-wordpress.northeurope.cloudapp.azure.com/wp-login.php` |
| WordPress gebruikersnaam         | `xFlyxng`                                                                  |
| WordPress paswoord               | `(i%TJJ6wvcscLh*rCw`                                                       |

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

### Scp

| Task                                                     | Command                         |
| :------------------------------------------------------- | :------------------------------ |
| Kopiëren van een file van VM naar lokale machine met scp | `scp naam@ip:pad_VM pad_lokaal` |

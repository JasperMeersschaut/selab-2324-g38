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

| Task                                                    | Command                                             |
| :------------------------------------------------------ | :-------------------------------------------------- |
| Firewall aanzetten                                      | `sudo ufw enable`                                   |
| Verkeer toelaten om een bepaalde applicatie te bereiken | `sudo ufw allow <port_number>`                      |
| Tonen op welke poorten verkeer toegelaten wordt         | `sudo ufw status`                                   |
| Tonen welke jails geconfigureerd zijn                   | `sudo fail2ban-client status`                       |
| Tonen welke IP-adressen geblokkeerd zijn                | `sudo fail2ban-client status <jail_name>`           |
| De findtime van een jail tonen                          | `sudo fail2ban-client get <jail_name> findtime`     |
| De maxretry van een jail tonen                          | `sudo fail2ban-client get <jail_name> maxretry`     |
| De bantime van een jail tonen                           | `sudo fail2ban-client get <jail_name> bantime`      |
| IP-adres vrijmaken voordat blokkeertijd is verlopen     | `sudo fail2ban-client set <jail_name> unbanip <ip>` |
| Applicatie laten opstarten bij booten VM                | `sudo systemctl enable <package_name>`              |
| Controleren of service opstart bij booten VM            | `systemctl is-enabled <package_name>`               |

### Shell

| Task                      | Command                     |
| :------------------------ | :-------------------------- |
| Verbinden met VM over SSH | `ssh osboxes@192.168.56.20` |

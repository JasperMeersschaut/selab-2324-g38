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

| Task                                                                    | Command                                |
| :---------------------------------------------------------------------- | :------------------------------------- |
| Machine afsluiten                                                       | `sudo poweroff`                        |
| Applicatie installeren                                                  | `sudo apt install -y <packagename>`    |
| Een lijst tonen van de software die nu geïnstalleerd is                 | `sudo apt list --installed`            |
| Van alle applicaties de laatste versie bijwerken                        | `sudo apt update`                      |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie | `sudo apt upgrade all`                 |
| Via de console een package opzoeken                                     | `sudo apt search <packagename>`        |
| Een geïnstalleerde applicatie verwijderen                               | `sudo apt remove <packagename>`        |
| Alle netwerk configuraties tonen                                        | `ip a`                                 |
| Controleren of de service draait                                        | `systemctl status <packagename>`       |
| Een service opnieuw opstarten                                           | `sudo systemctl restart <packagename>` |
| Alle netwerkpoorten die in gebruik zijn tonen                           | `sudo ss -tlnp`                        |

### Databank configureren in Linux

| Task                                              | Command                                                                                      |
| :------------------------------------------------ | :------------------------------------------------------------------------------------------- |
| SQL databank starten als root (zonder wachtwoord) | `sudo mysql`                                                                                 |
| SQL databank starten als root (met wachtwoord)    | `sudo mysql -u root -p`                                                                      |
| SQL databank gebruiken                            | `use mysql`                                                                                  |
| SQL databank afsluiten                            | `exit;`                                                                                      |
| De root configureren                              | `mysql alter user 'root'@'localhost' identified with mysql_native_password by '<password>';` |
| Een admin configureren                            | `create user 'admin'@'%' identified by '<password>';`                                        |
| Alle rechten aan een user geven                   | ` grant all privileges on *.* to '<user>'@'%' with grant option;`                            |
| Alle rechten van alle gebruikers updaten          | `flush privileges;`                                                                          |
| De beveiligingsopties van een databank instellen  | `sudo mysql_secure_installation`                                                             |

### MySQL Workbench

| Task                                                     | Command                                                |
| :------------------------------------------------------- | :----------------------------------------------------- |
| Een database maken                                       | `create database naam`                                 |
| Een user configureren                                    | `create user '<naam>'@'%' identified by '<password>';` |
| Alle rechten (behalve `GRANT OPTION`) aan een user geven | ` grant all privileges on *.* to '<user>'@'%';`        |
| Alle rechten van alle gebruikers updaten                 | `flush privileges;`                                    |

## Checklists

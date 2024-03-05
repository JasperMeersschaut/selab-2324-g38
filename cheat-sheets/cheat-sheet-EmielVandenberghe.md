# Cheat sheets en checklists

> Student: Emiel Vandenberghe

## Chocolatey

| Taak                                                   | Commando                         |
| :----------------------------------------------------- | :------------------------------- |
| Een lijst tonen van de software die nu geinstalleerd is via Chocolatey            | `choco list`                           |
| Overzicht van alle opties bruikbaar met het commando *choco*                       | `choco -?`       |
| Alle geinstalleerde packages bijwerken naar hun laatst beschikbare versie                                      | `choco upgrade all`   |
| Applicatie installeren (gebruik -y zodat er geen bevestiging wordt gevraagd)                                     | `choco install -y <packagenaam>`    |
| [package naam van een applicatie zoeken](https://community.chocolatey.org/packages/)                                   | / |
| Via de console een package opzoeken | `choco search <packagename>`                |
| Een geinstalleerde applicatie verwijderen        | `choco uninstall <packagename>`       |


## Markdown

| Taak                                                   | Commando                         |
| :----------------------------------------------------- | :------------------------------- |
| Woord in het vet zetten| `** ... **`|
| Woord schuin zetten | `* ... *` |
| Hoofding (hoe meer # hoe kleiner) | `# hoofding1 ## hooding2 ### hoofding3 ... `|
| Een hyperlink plaatsen | ` [tekst die je wilt tonen](link) ` |
| Een foto plaatsen | `![een beschrijving van de foto](link naar de foto) `|


## Poweshell ISE

| Taak                                                   | Commando                         |
| :----------------------------------------------------- | :------------------------------- |
| Testen of je kan verbinden met een applicatie| `ping <adres>`|
|Script runnen | `F5`|


## Linux

| Taak                                                   | Commando                         |
| :----------------------------------------------------- | :------------------------------- |
| Een service opnieuw opstarten| `sudo systemctl restart <packagename`|
| Alle netwerkpoorten die in gebruik zijn tonen | `sudo ss -tlnp` |
| Controleren of de service draait | `systemctl status <packagename>`|
| een applicatie installeren | ` sudo apt install -y <packagenaam> ` |
| MySQL openen om op locaal apparaat te werken | `mysql -u root -p`|
| Virtuele machine afsluiten | `sudo poweroff`|
| aantonen dat MySQL actief is| `systemctl status mysql`| 
|Een geïnstalleerde applicatie verwijderen| `sudo apt remove <package_name>`|
| SQL databank starten voor de eerste keer | `sudo mysql `|
| SQL databank gebruiken  | ` use mysql ` |     
| De root configureren                              | `mysql alter user 'root'@'localhost' identified with mysql_native_password by '<password>';` |
| Een admin configureren                            | `create user 'admin'@'%' identified by '<password>';`                                        |
| Alle rechten aan een admin geven                  | `grant all privileges on *.* to 'admin'@'%' with grant option;`                              |
| Alle rechten van alle gebruikers updaten          | `flush privileges;`   |
| SQL databank starten met wachtwoord    | `sudo mysql -u root -p `|
| De beveiligingsopties van een databank instellen  | `sudo mysql_secure_installation`                                                             |
| SQL databank afsluiten                            | `exit;`  |


## MySQL Workbench

| Taak                                                   | Commando                         |
| :----------------------------------------------------- | :------------------------------- |
|een user aanmaken/configureren | `create user '<naam>'@'%' identified by '<password>';`|
|alle rechten behalve WITH GRANT OPTION aan een user geven | `grant all privileges on *.* to '<user>'@'%'; `|
| De rechten effectief toekennen/updaten | `flush privileges`|








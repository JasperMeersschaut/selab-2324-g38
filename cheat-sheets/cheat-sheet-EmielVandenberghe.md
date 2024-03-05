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
| Virtuele machine afsluiten | `sudo poweroff`|
|Een geïnstalleerde applicatie verwijderen| `sudo apt remove <package_name>`|
| Alle netwerk configuraties tonen                                        | `ip a`                                 |


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

| Taak                                                   | Commando                         |
| :----------------------------------------------------- | :------------------------------- |
|een user aanmaken/configureren | `create user '<naam>'@'%' identified by '<password>';`|
|alle rechten behalve WITH GRANT OPTION aan een user geven | `grant all privileges on *.* to '<user>'@'%'; `|
| De rechten effectief toekennen/updaten | `flush privileges`|


## Linux en Appache

| Taak                                                   | Commando                         |
| :----------------------------------------------------- | :------------------------------- |
|kijken welke netwerkpoort gebruikt wordt voor hhtps | `grep 'https' /etc/services`|
|ervoor zorgen dat fqil2ban start bij opstart vm | `sudo systemctl start fail2ban`|
|ervoor zorgen dat fail2ban 'aan' staat | `sudo systemctl enable fail2ban`|






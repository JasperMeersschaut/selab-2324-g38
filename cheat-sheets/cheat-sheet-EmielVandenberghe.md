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







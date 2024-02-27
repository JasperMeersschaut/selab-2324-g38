# Cheat sheets en checklists

> Student: Jasper Meersschaut

## 1-package-manager-markdown

## De apt package manager

### Powershell

| Task                                                                         | Command                          |
| :--------------------------------------------------------------------------- | :------------------------------- |
| Commentaarregel schrijven                                                    | `#`                              |
| Tekst afdrukken op de console                                                | `Write-Host`                     |
| Script runnen                                                                | `Fn + F5`                        |
| Overzicht van alle opties en parameters bruikbaar met het commando **choco** | `choco -?`                       |
| Applicatie installeren                                                       | `choco install -y <packagename>` |
| Een lijst tonen van de software die nu geïnstalleerd is via apt              | `choco list`                     |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie      | `choco upgrade all`              |
| Via de console een package opzoeken                                          | `choco search <packagename>`     |
| Een geïnstalleerde applicatie verwijderen                                    | `choco uninstall <packagename>`  |

### Linux

| Task                                                                    | Command                          |
| :---------------------------------------------------------------------- | :------------------------------- |
| Standaard extensie voor bash scripts                                    | `.sh`                            |
| Eerste regel van script (shebang)                                       | `#!`                             |
| Commentaarregel schrijven                                               | `#`                              |
| Tekst afdrukken op de console                                           | `echo`                           |
| Commando runnen als super user                                          | `sudo`                           |
| Een lijst tonen van de software die nu geïnstalleerd is via apt         | `apt list --installed`           |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie | `sudo apt update`                |
| Via de console een package opzoeken                                     | `apt search <package_name>`      |
| Een geïnstalleerde applicatie verwijderen                               | `sudo apt remove <package_name>` |

## Markdown

| Task                         | Command                     |
| :--------------------------- | :-------------------------- |
| Header 1, Header 2, Header 3 | `#Hallo, ##Hallo, ###Hallo` |
| Bold                         | `**Hallo**`                 |
| Commentaarregel schrijven    | `<!--Hallo-->`              |
| Bash code schrijven          | ` \`\`\` bash \`\`\` `                |
| Hyperlink                 |      |
<!-- | Tabel row maken          |                   | -->

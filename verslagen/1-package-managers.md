# Verslag: Package manager & Markdown

> Naam verslaggever: NAME

## Beschrijving

Beschrijf de opdracht in eigen woorden. Wat werd er van jullie verwacht? Wat was het doel van de opdracht?

## Antwoorden op de vragen in de opdracht

### Vraag 1 - Beantwoord onderstaande vragen.

**1. De PowerShell-prompt toont de map waar we ons nu bevinden. Wat is de naam van deze directory?**<br>

De naam van de directory waar we ons in bevinden is `system32`. Dat kunnen we afleiden uit het meegegeven pad dat er als volgt uit ziet:

```powershell
PS C:\WINDOWS\system32>
```

**2. In welke map heb je het script bewaard?**<br>

Antwoord nog aan te vullen.

**3. In welke map is het script bewaard in de screenshot?**<br>

Het script is bewaard in de map SELab dat deel uitmaakt van de map HoGent. Dat halen we uit het pad meegegeven in de screenshot.

| ![Meegegeven screenshot](./img/package-manager/uitvoer-script.png) |
| :----------------------------------------------------------------: |
|       Figuur 1. Resultaat van het uitvoeren van het script.        |

### Vraag 2 - Zoek op welke commando's je nodig hebt voor de hieronder opgesomde taken.

| Taak                                                                    | Commando                        |
| ----------------------------------------------------------------------- | ------------------------------- |
| Een lijst tonen van de software die nu geïnstalleerd is via Chocolatey  | `choco list`                    |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie | `choco upgrade all`             |
| Via de console een package opzoeken                                     | `choco search <packagename>`    |
| Een geïnstalleerde applicatie verwijderen                               | `choco uninstall <packagename>` |

### Vraag 3 - Werk het installatiescript af, structureer zelf je script en zorg dat de hoofdingen meer in het oog springen.

Als je onderstaand script uitvoert, krijg je de keuze of je software wilt installeren, updaten of verwijderen.

- Bij het kiezen van 'Instal' ga je de vraag krijgen of je alle software, of enkel software voor 1 vak wilt downloaden. Nadien gaat het script de software installeren afhankelijk van je keuze.
- Bij het kiezen van 'Update' gaat het script alle software updaten.

- Bij het kiezen van 'Delete' ga je moeten invullen welke software je wilt verwijderen. Nadien verwijderd het script deze software.

```PowerShell
#Automatiseren software-installatie

Function InstallAll {
    InstallAlgemeneApplicaties
    InstallSystemEngineeringLab
}
Function InstallAlgemeneApplicaties {
    Write-Host "`n`n`nInstallatie algemene applicaties"
    Write-Host "--------------------------------"
    Write-Host "`n- Git installeren"
    choco install -y git
    Write-Host "`n- Adobe Acrobat Reader installeren"
    choco install -y adobereader
    Write-Host "`n- Firefox installeren"
    choco install -y firefoxdownloadsview
    Write-Host "`n- GitHub Desktop installeren"
    choco install -y github
    Write-Host "`n- Visual Studio Code installeren"
    choco install -y vscode
    Write-Host "`n- VLC Media Player installeren"
    choco install -y vlc
}
Function InstallSystemEngineeringLab {
    Write-Host "`n`n`nInstallatie System Engineering Lab"
    Write-Host "------------------------------------"
    Write-Host "`n- FileZilla installeren"
    choco install -y filezilla
    Write-Host "`n- VirtualBox installeren"
    choco install -y virtualbox
    Write-Host "`n- MySQL Workbench installeren"
    choco install -y mysql.workbench
}

$choice = Read-Host -Prompt 'Instal [A] - Update [B] - Delete [C]'
if ('A' -eq $choice) {
    $type = Read-Host -Prompt 'Instal all [A] - Install `Algemene applicaties` [B] - Install `System Engineering Lab` [C]'
    switch ($type) {
        'A' {InstallAll}
        'B' {InstallAlgemeneApplicaties}
        'C' {InstallSystemEngineeringLab}
    }
}
if ('B' -eq $choice) {
    choco upgrade all
}
if ('C' -eq $choice) {
    $app = Read-Host -Prompt 'What package do you want to delete?'
    choco uninstall $app
}
```

## Evaluatiecriteria

- [x] Je hebt een package manager voor jouw besturingssysteem geïnstalleerd.
- [x] Je hebt een script (PowerShell of Bash, afhankelijk van je besturingssysteem) geschreven en gebruikt om de opgesomde applicaties te installeren.
- [x] Je toont inzicht in de werking van een package manager en kan deze vlot kan gebruiken om basistaken uit te voeren.
- [ ] Je hebt een verslag gemaakt op basis van het template.
  - Wordt nog aan gewerkt.
- [ ] De cheat sheet werd aangevuld met nuttige commando's die je wenst te onthouden voor later.
  - Nog niet iedereen heeft deze taak volbracht.

## Problemen en oplossingen

### Probleem 1 - Korte beschrijving van het probleem

Beschrijf hier het probleem uitgebreid met screenshots, code snippets, enz. en de oplossing die jullie al dan niet hebben gevonden.

## Voorbereiding demo

Beschrijf hier hoe je elk evaluatiecriterium zal demonstreren. Geef ook aan welke bestanden, commando's, enz. je zal gebruiken tijdens de demo.

### Bestanden voor de demo

- Voorbeeld van het [Installatie.ps1](./demo's/demo-1/Installatie.ps1) script.

### Commando's voor de demo

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

## Reflecties

Wat was moeilijk? Wat was eenvoudig? Wat hebben jullie geleerd van de opdracht? Wat zouden jullie anders doen als jullie het opnieuw moesten doen?

Als jullie nog andere opmerkingen hebben over de opdracht hebben, voel je vrij om ze te delen.

## Bronnen

- https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/read-host?view=powershell-7.4
- https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.4
- https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.4#a-simple-function
- https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_switch?view=powershell-7.4

# Cheat sheets en checklists

> Student: Jasper Meersschaut

## 1-package-manager-markdown

### De apt package manager

#### Powershell

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

#### Linux

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

### Markdown

| Task                         | Command                          |
| :--------------------------- | :------------------------------- |
| Header 1, Header 2, Header 3 | `#Hallo, ##Hallo, ###Hallo`      |
| Bold                         | `**Hallo**`                      |
| Commentaarregel schrijven    | `<!--Hallo-->`                   |
| Bash code schrijven          | \`\`\` bash \`\`\`               |
| Hyperlink                    | `[Tekst](https://www.Link.com)` |

## 2-databankserver
### HoofdOpdracht
#### VM installatie
- Via `enp0s8` is de VM verbonden met de host. De host heeft een vast IP-adres 
- `ip a` toont de netwerkinterfaces
#### Configuratie van de databankserver
- `sudo apt update` om de package lijst te updaten
- `sudo apt install mysql-server` om de MySQL server te installeren
- `sudo status mysql` om te controleren of de MySQL server actief is
- `sudo ss -tlnp` om te controleren of de MySQL server luistert op poort 3306
- `sudo systemctl restart mysql` om de MySQL server te herstarten
- `sudo systemctl status mysql` om te controleren of de MySQL server actief is
#### Configuratie van de databank
- `sudo mysql` om in de MySQL shell te komen
- use mysql; om de mysql databank te selecteren
- `alter user 'root'@'localhost' identified with mysql_native_password by 'letmein';` om het wachtwoord van de root gebruiker te wijzigen naar 'letmein'
- `create user 'admin'@'%' identified by 'letmein';` om een nieuwe gebruiker aan te maken
- `grant all privileges on *.* to 'admin'@'%' with grant option;` om alle rechten toe te kennen aan de nieuwe gebruiker
- `flush privileges;` om de privileges te herladen
- `exit` om de MySQL shell te verlaten 
- `sudo mysql_secure_installation` om de MySQL server te beveiligen
```
Validate Password activeren? NEE
Wachtwoord voor root aanpassen? NEE
Remove anonymous users? JA
Disallow root login remotely? JA
Remove test database? JA
Reload Privileges table? JA
```
#### Mysql workbench
Test nu of je vanop je fysieke systeem via MySQL Workbench kan verbinden met MySQL in je VM. Start MySQL Workbench op en doe het volgende:
- Maak een nieuwe verbinding aan.
- Kies een naam voor de verbinding (bv. UbuntuVM-admin).
- Hostnaam: 192.168.56.20
- Username: admin
- Test eerst de verbinding en sla het wachtwoord op in de "vault".
### Uitbreiding
#### FileZilla
> Probeer of je met FileZilla/Cyberduck bestanden van/naar de VM kan kopiëren. Dit zal extra configuratie vereisen.
##### Ubuntu
- `sudo apt install vsftpd` om de FTP server te installeren
- `sudo nano /etc/vsftpd.conf` om de configuratie van de FTP server aan te passen
```
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
```
- `sudo systemctl restart vsftpd` om de FTP server te herstarten
##### Windows
- Open FileZilla
- Ga naar `Bestand` > `Sitebeheer`
- Klik op `Nieuwe site`
- Vul de volgende gegevens in:
```
Host: 192.168.56.20
Type: FTP
Poort: leeg laten
Gebruikersnaam: osboxes
Wachtwoord: osboxes.org
```
- Klik op `Verbinden`
- Nu kan je bestanden van/naar de VM kopiëren
#### SSH
> Configureer de VM zodat je via SSH kan inloggen vanop je fysieke systeem (via een wachtwoord en/of public/private keypair).
##### Ubuntu
- `sudo apt install openssh-server` om de SSH server te installeren
- `sudo nano /etc/ssh/sshd_config` om de configuratie van de SSH server aan te passen
```
passwordauthentication YES
pubkeyauthentication YES
```
- `sudo systemctl restart ssh` om de SSH server te herstarten
##### Windows
- Breng je public key over via FileZilla naar je VM.
- Voeg je public key toe aan `~/.ssh/authorized_keys`.

  - Indien `authorized_keys` nog niet bestaat, maak je eerst een nieuw tekstbestand aan met die naam.

  > Nu kan je via de terminal inloggen op je virtuele machine via
  > `ssh osboxes@192.168.56.20`

# TODO: fix cheatsheet
Activeer de firewall met het ufw-commando. Dit kan met het volgende commando in de terminal:
```bash	
sudo ufw enable
```	

Laat verkeer op de poorten uit stap 1 toe door de firewall. Dit kan met het volgende commando voor elke poort:
```bash	
sudo ufw allow <poortnummer>/tcp

```	
- `sudo apt install apache2` installeert de apache webserver
- `sudo systemctl status apache2` toont de status van de apache webserver
- `sudo systemctl is-enabled apache2` toont of de apache webserver opstart bij het booten van de VM
- `sudo nano /etc/apache2/ports.conf` toont de configuratie van de apache webserver
- `/var/www/html/` is de map waarin de websitebestanden moeten geplaatst worden
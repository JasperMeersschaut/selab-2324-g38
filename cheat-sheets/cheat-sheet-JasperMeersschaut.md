# Cheat sheets en checklists

> Student: Jasper Meersschaut

## Powershell

| Task                          | Command      |
| :---------------------------- | :----------- |
| Commentaarregel schrijven     | `#`          |
| Tekst afdrukken op de console | `Write-Host` |
| Script runnen                 | `Fn + F5`    |

## chocolatey package manager

| Task                                                                         | Command                          |
| :--------------------------------------------------------------------------- | :------------------------------- |
| Overzicht van alle opties en parameters bruikbaar met het commando **choco** | `choco -?`                       |
| Applicatie installeren                                                       | `choco install -y <packagename>` |
| Een lijst tonen van de software die nu geïnstalleerd is via apt              | `choco list`                     |
| Alle packages die nu geïnstalleerd zijn bijwerken tot de laatste versie      | `choco upgrade all`              |
| Via de console een package opzoeken                                          | `choco search <packagename>`     |
| Een geïnstalleerde applicatie verwijderen                                    | `choco uninstall <packagename>`  |

## Linux: bash scripting

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

| Task                         | Command                         |
| :--------------------------- | :------------------------------ |
| Header 1, Header 2, Header 3 | `#Hallo, ##Hallo, ###Hallo`     |
| Bold                         | `**Hallo**`                     |
| Commentaarregel schrijven    | `<!--Hallo-->`                  |
| Bash code schrijven          | \`\`\` bash \`\`\`              |
| Hyperlink                    | `[Tekst](https://www.Link.com)` |

- `ip a` toont de netwerkinterfaces

## Linux: Configuratie van de databankserver

| Task                                                  | Command                         |
| :---------------------------------------------------- | :------------------------------ |
| De package lijst updaten                              | `sudo apt update`               |
| De packages upgraden                                  | `sudo apt upgrade`              |
| De MySQL server installeren                           | `sudo apt install mysql-server` |
| Controleren of de MySQL server actief is              | `sudo status mysql`             |
| Controleren of de MySQL server luistert op poort 3306 | `sudo ss -tlnp`                 |
| De MySQL server herstarten                            | `sudo systemctl restart mysql`  |

## Linux: Configuratie van de databank

| Task                                           | Command                                                                             |
| :--------------------------------------------- | :---------------------------------------------------------------------------------- |
| De MySQL shell starten                         | `sudo mysql`                                                                        |
| De mysql databank selecteren                   | `use mysql;`                                                                        |
| Het wachtwoord wijzegin van de root            | `alter user 'root'@'localhost' identified with mysql_native_password by 'letmein';` |
| Een nieuwe gebruiker aanmaken                  | `create user 'admin'@'%' identified by 'letmein';`                                  |
| Alle rechten toekennen aan de nieuwe gebruiker | `grant all privileges on *.* to 'admin'@'%' with grant option;`                     |
| De privileges herladen                         | `flush privileges;`                                                                 |
| De MySQL shell verlaten                        | `exit`                                                                              |
| De MySQL server beveiligen                     | `sudo mysql_secure_installation`                                                    |

```
Validate Password activeren? NEE
Wachtwoord voor root aanpassen? NEE
Remove anonymous users? JA
Disallow root login remotely? JA
Remove test database? JA
Reload Privileges table? JA
```

## Linux: Configuratie van FileZilla FTP server

- `sudo apt install vsftpd` om de FTP server te installeren
- `sudo nano /etc/vsftpd.conf` om de configuratie van de FTP server aan te passen

```
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
```

- `sudo systemctl restart vsftpd` om de FTP server te herstarten

## Windows: Configuratie van FileZilla FTP server

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

## Linux: SSH

| Task                                        | Command                           |
| :------------------------------------------ | :-------------------------------- |
| De SSH server installeren                   | `sudo apt install openssh-server` |
| De configuratie van de SSH server aanpassen | `sudo nano /etc/ssh/sshd_config`  |
| De SSH server herstarten                    | `sudo systemctl restart ssh`      |

In de file **sshd_config** de volgende regels aanpassen:

```
passwordauthentication YES
pubkeyauthentication YES
```

## Windows: SSH

- Breng je public key over via FileZilla naar je VM.
- Voeg je public key toe aan `~/.ssh/authorized_keys`.

  - Indien `authorized_keys` nog niet bestaat, maak je eerst een nieuw tekstbestand aan met die naam.

  > Nu kan je via de terminal inloggen op je virtuele machine via
  > `ssh osboxes@192.168.56.20`

## Webserver: apache2

| Task                                                                       | Command                                |
| :------------------------------------------------------------------------- | :------------------------------------- |
| Installeer apache2                                                         | `sudo apt install apache2`             |
| Controleer of apache2 actief is                                            | `sudo systemctl status apache2`        |
| Controleer of apache2 opstart bij het booten van de VM                     | `sudo systemctl is-enabled apache2`    |
| Pad naar de root map van apache2                                           | `/var/www/html`                        |
| Maak de gebruiker lid van de groep www-data                                | `sudo usermod -aG www-data osboxes`    |
| Maak de root map van apache2 eigendom van de groep www-data                | `sudo chgrp -R www-data /var/www/html` |
| Geef de groep www-data lees- en schrijfrechten tot de root map van apache2 | `sudo chmod -R g+rw /var/www/html`     |

## Webserver: SSL/HTTPS

| Task                         | Command                                                                      |
| :--------------------------- | :--------------------------------------------------------------------------- |
| Activeer SSL/HTTPS           | `sudo a2enmod ssl; sudo a2ensite default-ssl; sudo systemctl reload apache2` |
| Het nieuwe ip van de website | `https://192.168.56.20`                                                      |

## Webserver: Firewall

| Task                                                    | Command                        |
| :------------------------------------------------------ | :----------------------------- |
| Firewall aanzetten                                      | `sudo ufw enable`              |
| Verkeer toelaten om een bepaalde applicatie te bereiken | `sudo ufw allow <poortnummer>` |
| Tonen op welke poorten verkeer toegelaten wordt         | `sudo ufw status`              |

## Webserver: Fail2Ban

| Task                                            | Command                              |
| :---------------------------------------------- | :----------------------------------- |
| Fail2Ban installeren                            | `sudo apt install fail2ban`          |
| Fail2Ban activeren                              | `sudo systemctl enable fail2ban`     |
| Fail2Ban herstarten                             | `sudo systemctl restart fail2ban`    |
| Fail2Ban configuratie aanpassen                 | `sudo nano /etc/fail2ban/jail.local` |
| Hoe ver terug Fail2Ban kijkt                    | `findtime`                           |
| Hoeveel keer een IP-adres mag proberen inloggen | `maxretry`                           |
| Hoe lang een IP-adres geblokkeerd blijft        | `bantime`                            |

## Gegevens azure

| **Variabele**                    | **Inhoud**                                     |
| -------------------------------- | ---------------------------------------------- |
| Resourcegroep                    | SELabs-Wordpress                               |
| Naam databankserver              | mj-wordpressdb                                 |
| DNS-naam databankserver          | mj-wordpressdb.mysql.database.azure.com        |
| Beheerder databankserver         | jasper                                         |
| Wachtwoord databankserver        | fhQrWdtjKS@HB6^je3a3                           |
| Naam applicatieserver (Ubuntu)   | mj-wordpressapp                                |
| DNS-naam applicatieserver        | mj-wordpressapp.northeurope.cloudapp.azure.com |
| Gebruikersnaam applicatieserver  | jasper                                         |
| Wachtwoord applicatieserver      | 776unvHAtu&^2iVm$Z$c                           |
| WordPress db user                | bv. "wordpress"                                |
| Wachtwoord van WordPress db user | bv. "wordpresspwd"                             |
| WordPress user                   | admin                                          |
| WordPress user password          | 7OS#LJ6()ayO0UHoct                             |
| DNS naam van de website          | meersschaut.live                               |

| **Variabele**                                           | **Inhoud**                                                      |
| ------------------------------------------------------- | --------------------------------------------------------------- |
| Login website                                           | [SELabs-Wordpress Login](https://meersschaut.live/wp-login.php) |
| Gewone website                                          | [SELabs-Wordpress](https://meersschaut.live/)                   |
| Awesome selfhosted website                              | [adarkroom](https://adarkroom.meersschaut.live/)                |
| SSH verbinding met applicatie server                    | `ssh jasper@mj-wordpressapp.northeurope.cloudapp.azure.com`     |
| Verbinden met de databankserver vanuit applicatieserver | `mysql -h mj-wordpressdb.mysql.database.azure.com -u jasper -p` |

## Linux: MySQL

| Task                            | Command                                                         |
| :------------------------------ | :-------------------------------------------------------------- |
| MYSQL client downloaden         | `sudo apt install mysql-client`                                 |
| Verbinden met de databankserver | `mysql -h mj-wordpressdb.mysql.database.azure.com -u jasper -p` |
| MySQL verlaten                  | `exit`                                                          |

## Linux: Wordpress

| Task                                               | Command                                                                                                                                      |
| :------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------- |
| Dependencies installeren die Wordpress nodig heeft | `sudo apt install apache2 ghostscript libapache2-mod-php php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-xml php-zip` |
| Wordpress downloaden en uitpakken stap 1           | `sudo mkdir -p /srv/www`                                                                                                                     |
| Wordpress downloaden en uitpakken stap 2           | `sudo chown www-data: /srv/www`                                                                                                              |
| Wordpress downloaden en uitpakken stap 3           | `curl https://wordpress.org/latest.tar.gz \| sudo -u www-data tar zx -C /srv/www`                                                            |

## Linux: Docker

| Task                                  | Command                                                                                                                                                                                                |
| :------------------------------------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Commando voor juiste key te genereren | `openssl req -x509 -nodes -newkey rsa:2048 -days 365 -keyout key.pem -out key.crt`                                                                                                                     |
| Vaultwarden installeren               | `sudo docker run -d --name bitwarden -e ROCKET_TLS='{certs="/ssl/key.crt",key="/ssl/key.pem"}' -v /home/osboxes/Certificates:/ssl -v ~/.files-vaultwarden:/data/ -p 8080:80 vaultwarden/server:latest` |

## Gegevens:Docker

| **Variabele**        | **Inhoud**     |
| -------------------- | -------------- |
| Naam portainer       | admin          |
| Wachtwoord portainer | (Bitwarden ww) |

## Troubleshooting

- [x] Netwerk
  - [x] Het toestel beschikt over internet
  ```bash
  ping google.com
  ```
  - [x] Het toestel kan via externe host gepingd worden op 192.168.56.20.
  ```bash
  ping 192.168.56.20
  ```
- [x] Webserver (apache2)
  - [x] Moet bereikbaar zijn via de browser in de hostomgeving via <https://192.168.56.20>.
    > Surf naar [https://192.168.56.20](https://192.168.56.20)
  - [x] Het is mogelijk om via de Ubuntu gebruiker bestanden naar de webserver (in map`/var/www`) te uploaden via FileZilla (of een gelijkaardige tool) vanuit de hostomgeving via 192.168.56.20, poort 22 (via SFTP). ⚠️ Je overschrijft echter niet het door ons aangeleverde `index.html` bestand.
  > Gebruik FileZilla om bestanden te uploaden naar de webserver.
- [ ] Databankserver (mariadb)
  - [x] Databank `appdb` moet bereikbaar zijn via MySQL Workbench in de hostomgeving via 192.168.56.20, poort 3306 voor de gebruiker `appusr` en het wachtwoord `letmein!`.
  > Verbind met de databank via MySQL Workbench.
  - [ ] Moet alleen lokaal toegankelijk zijn vanaf de VM zelf via het MySQL-commando voor de gebruiker `admin` en het wachtwoord `letmein!` en via de MySQL Workbench maar enkel dan via een SSH connectie.
  > Verbind met de databank via MySQL Workbench
- [ ] Wordpress
  - [ ] Moet bereikbaar zijn via de browser in de hostomgeving via <http://192.168.56.20:8080> voor de gebruiker `wpuser` en het wachtwoord `letmein!` en gebruikt de database `wpdb`.
  - [ ] Er moet een post aangemaakt zijn (met inhoud naar keuze)
- [x] SSH
  - [x] Er moet een verbinding gemaakt kunnen worden via ssh van buitenaf naar 192.168.56.20 op poort 22 voor de gebruiker `trouble` en het wachtwoord `shoot`.
- [ ] Docker
  - [ ] Vaultwarden, Minetest en Portainer draaien via Docker Compose, net als in opdracht 5.
    - [ ] Vaultwarden en minetest gebruiken lokale mappen voor data
    - [ ] Portainer gebruikt een docker volume voor zijn data
  - [ ] Beide pagina's zijn extern bereikbaar via een beveiligde verbinding en er kan ingelogd worden via:
    - [ ] Portainer: <https://192.168.56.20:9443>
    - [ ] Vaultwarden: <https://192.168.56.20:4123>
  - [ ] Bij Minetest is het mogelijk om een spel te joinen door de minetest client te gebruiken op de host via <https://192.168.56.20:30000> voor de gebruiker `trouble` en het wachtwoord `shoot`.
  - [ ] Planka draait via een aparte docker compose service (~/docker/planka/) en is bereikbaar via <https://192.168.56.20:3000> voor de gebruiker `admin` en het wachtwoord `troubleshoot`.

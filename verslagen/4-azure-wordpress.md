# Verslag 4: WordPress opzetten in de Microsoft Azure cloudomgeving

> Naam verslaggever: Emiel Vandenberghe

## :speech_balloon: Beschrijving

In deze opdracht hebben we een virtuele machine opgezet in Azure en hierop een WordPress blog geïnstalleerd. We hebben ook een MySQL database opgezet en deze gekoppeld aan de WordPress blog. We hebben ook een SSL certificaat aangevraagd en geïnstalleerd op de virtuele machine. Als uitbreidingen hebben we een domeinnaam aangevraagd en de WordPress blog hieraan gekoppeld. We hebben ook een nieuw thema geïnstalleerd op de WordPress blog.

## :thinking: Antwoorden op de vragen in de opdracht

**In de configuratiemap van Apache is er nog een map /etc/apache2/sites-enabled Wat is verschil tussen beide?**

- Het verschil tussen de twee mappen is dat `sites-available` alle mogelijke opties bevat, terwijl `sites-enabled `alleen de actieve configuraties bevat die Apache daadwerkelijk gebruikt. Dit maakt het gemakkelijk om verschillende websites in- en uit te schakelen zonder de configuratiebestanden te hoeven verwijderen of hernoemen.

## :memo: Evaluatiecriteria

- [x] Je kan de aangemaakte machines tonen in de Azure omgeving.
- [x] Het lukt om een SSH-verbinding op te zetten met de applicatieserver.
- [x] Het lukt om aan te melden op MySQL op de databankserver vanaf de applicatieserver.
- [x] Je kan met HTTPS surfen naar jouw WordPress blog.
- [x] Je kan kan aanmelden en het WordPress dashboard tonen.
- [x] Je kan een nieuw bericht posten op jouw WordPress blog.
- [x] Je hebt een verslag gemaakt op basis van het template.
- [x] De cheat sheet werd aangevuld met nuttige commando's die je wenst te onthouden voor later.

## :information_desk_person: Voorbereiding demo

### Je kan de aangemaakte machines tonen in de Azure omgeving.

- Surf naar https://portal.azure.com/#home
  - Navigaar naar all resources
  - Toon de VM en de Azure database

| ![Screenshot Webbrowser](./img/4-azure-wordpress/foto1.png) |
| :---------------------------------------------------------: |
|      Figuur 1. Aantonen aangemaakte machines in Azure       |

### Het lukt om een SSH-verbinding op te zetten met de applicatieserver.

- Navigeer naar de virtuele machine op azure
  - Kopieer de DNS name
  - Open je command prompt op windows en voer `ssh <gebruikersnaam>@<dns naam> ` in
  - Geef vervolgens dan het wachtwoord in dat je bijhield op je cheatcheet

| ![Screenshot Webbrowser](./img/4-azure-wordpress/Screenshot%202024-03-23%20135012.png) |
| :------------------------------------------------------------------------------------: |
|                         Figuur 2. DNS naam zoeken en kopieren                          |

| ![Screenshot Command prompt](./img/4-azure-wordpress/Screenshot%202024-03-23%20135200.png) |
| :----------------------------------------------------------------------------------------: |
|                       Figuur 3. Aantonen succesvolle SSH verbinding                        |

### Het lukt om aan te melden op MySQL op de databankserver vanaf de applicatieserver.

- Open de reeds gemaakt SSH verbinding met de applicatieserver
- Haal eerst de laatste informatie van de package repositories op met `sudo apt update `
- Voer de updates uit `sudo apt upgrade`
- Installeer MySQL client met ` sudo apt install mysq-client`

| ![Screenshot Webbrowser](./img/4-azure-wordpress/Screenshot%202024-03-23%20140414.png) |
| :------------------------------------------------------------------------------------: |
|                     Figuur 4. command prompt voorbereiden op mysql                     |

- Verbind met Mysql databankserver met ` mysql -h <host> -u <user> -p
  - Navigeer voor de gegevens naar de databankserver op Azure
  - Als je hier een error krijgt zal je eerst de instellingen van de firewall moeten aanpassen op Azure. Je moet hier je IP adres goed zetten.

| ![Screenshot Webbrowser](./img/4-azure-wordpress/Screenshot%202024-03-23%20140725.png) |
| :------------------------------------------------------------------------------------: |
|                       Figuur 5. Met de databankserver verbinden                        |

### Je kan met HTTPS surfen naar jouw WordPress blog.

- Je configureerd word press volgens de stappen.
- Surf naar je DNS naam op een browser

| ![Screenshot Webbrowser](./img/4-azure-wordpress/localhost.png) |
| :-------------------------------------------------------------: |
|          Figuur 6. Succesvolle connectie met Wordpress          |

- Als je je certificaat correct hebt aangevraagd zou je ook dit moeten krijgen

| ![Screenshot Webbrowser](./img/4-azure-wordpress/Screenshot%202024-03-23%20142148.png) |
| :------------------------------------------------------------------------------------: |
|                      Figuur 7. Succesvol aangemaakte certificaat                       |

### Je kan een nieuw bericht posten op jouw WordPress blog.

- Surf naar je DNS naam en typ hieracher `/wp-admin`
  - Log in
- Navigeer naar posts en laat je creativiteit maar gaan!

| ![Screenshot Webbrowser](./img/4-azure-wordpress/wpadmin.png) |
| :-----------------------------------------------------------: |
|                Figuur 8. Een niewe post maken                 |

## Mogelijke uitbreidingen

### Configuur de virtuele machine zodat je kan aanmelden met een SSH key.

- Genereer een SSH key met `ssh-keygen -t rsa -b 4096 -C ` als je dit nog niet had.
- Ga in je vm naar de map `~/.ssh` en maak een bestand `authorized_keys` aan. Kopieer hier de inhoud van je public key `C:\Users\jaspe\.ssh\id_rsa.pub` in.
- Nu kan je inloggen met `ssh <gebruikersnaam>@<dns naam>` zonder wachtwoord.

### Installeer een ander thema voor je WordPress blog.

- Ga naar je WordPress dashboard en navigeer naar `Appearance` en `Themes`
- Kies een thema en installeer deze
  | ![Screenshot Webbrowser](./img/4-azure-wordpress/WordpressNieuwThemaInstalleren.png) |
  | :------------------------------------------------------------------------------------: |
  | Figuur 9. Een nieuw thema installeren |

### Maak een script voor de installatie van de WordPress blog.

Werkt niet niet af, maar zou er zo kunnen uitzien:

```bash
#!/bin/bash
# Update de package repositories
sudo apt update

# Installeer de benodigde dependencies
sudo apt install -y apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-xml \
                 php-zip

#Maak de directory aan voor wordpress
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
#Installeer wordpress
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
# Creëer een Apache-site voor WordPress

echo "<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>" > /etc/apache2/sites-available/wordpress.conf

# Activeer de WordPress-site
sudo a2ensite wordpress

# Activeer URL rewriting
sudo a2enmod rewrite

# Schakel de standaard "It Works" site uit
sudo a2dissite 000-default

# Herlaad Apache voor de wijzigingen
sudo service apache2 reload
```

### Voer andere veiligheidsmaatregelen door op de virtuele machine (bv. fail2ban).

- Update de package repositories met `sudo apt update`
- Upgrade de geïnstalleerde pakketten met `sudo apt upgrade`
- Installeer fail2ban met `sudo apt install fail2ban`
- Start fail2ban met `sudo systemctl start fail2ban`
- Zorg ervoor dat fail2ban automatisch start bij het opstarten met `sudo systemctl enable fail2ban`
- Controleer of fail2ban actief is met `sudo systemctl status fail2ban`
- Configureer fail2ban naar wens met `sudo nano /etc/fail2ban/jail.local`
  - bv. `bantime = 600` om de ban tijd te verlengen naar 10 minuten
  - bv. `maxretry = 3` om het aantal pogingen te verlagen naar 3
  - bv. `findtime = 600` om de tijd te verlengen naar 10 minuten

### De WordPress blog is bereikbaar via een eigen domeinnaam.

- Claim een domeinnaam bij een provider naar keuze (name.com, namecheap.com, ...)
- Ga naar de DNS instellingen van je domeinnaam en voeg een A-record toe dat verwijst naar het IP-adres van je Azure VM, geef als hostnaam `@` op.
- Wacht enkele uren tot de DNS instellingen zijn doorgevoerd.
- Ga naar je WordPress dashboard en navigeer naar `Settings` en `General`
- Vul bij `WordPress Address (URL)` en `Site Address (URL)` je domeinnaam in.
- Sla de wijzigingen op en log opnieuw in op je WordPress dashboard.
  | ![Screenshot Webbrowser](./img/4-azure-wordpress/ManageDNSname.com.png) |
  | :------------------------------------------------------------------------------------: |
  | Figuur 10. Een domeinnaam instellen |

### Kies een service van de awesome-selfhosted list en installeer deze op een virtuele machine in Azure.


### Zorg ervoor dat alle services (ook WordPress) bereikbaar zijn via een domeinnaam en dat de verbinding beveiligd is met een certificaat van Let's Encrypt.

## Reflecties

## Bronnen

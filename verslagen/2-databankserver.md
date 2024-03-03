# Verslag: Een databankserver opzetten in een VM

> Naam verslaggever: Sam Ramaswami

## Beschrijving

We hebben geleerd om een databankserver op te zetten in een VM. Dit zorgt ervoor dat er geen processen op de achtergrond lopen die resources gebruiken op onze eigen laptop (ook wanneer de databank niet in gebruik is). We spreken de databank aan over een virtueel netwerk.

## Antwoorden op de vragen in de opdracht

### Vraag 1 - Controleer welke netwerkpoorten in gebruik zijn en stel vast dat MySQL enkel luistert op de "loopback interface". Waaraan zie je dit?

Het IP-adres 127.0.0.1 is toegekend aan de loopback interface, we zien hier dat MySQL enkel hierop luistert.

| ![Screenshot loopback adres](./img/2-databankserver/LOOPBACK-adres.png) |
| :---------------------------------------------------------------------: |
|                        Figuur 1. Loopback adres                         |

| ![Screenshot netwerkpoorten](./img/2-databankserver/Netwerkpoorten.png) |
| :---------------------------------------------------------------------: |
|                        Figuur 2. Netwerkpoorten                         |

### Vraag 2 - Zorg ervoor dat MySQL luistert naar alle netwerkinterfaces door het bestand **/etc/mysql/mysql.conf.d/mysqld.cnf** aan te passen. Zoek in dit bestand naar de regel die het **bind-address** instelt op **127.0.0.1** en verander dit naar **0.0.0.0**. Waarom `0.0.0.0` en niet het ip adres `192.168.56.20`?

De parameter **bind-address** bepaalt welke netwerkinterfaces MySQL gebruikt om inkomende verbindingen te accepteren. Indien dit wordt ingesteld op het loopback-adres `127.0.0.1`, zal MySQL alleen verbindingen accepteren die afkomstig zijn van de VM (dezelfde machine waarop de server draait). We stellen **bind-address** in op `0.0.0.0` omdat MySQL dan verbindingen accepteert van elk IP-adres (dus ook onze lokale machine). Het adres `192.168.56.20` is van de VM, dus dan zouden we geen connectie kunnen maken vanuit onze lokale machine.

### Vraag 3 - Controleer met `ss -tlnp` of de wijziging effect had. Waaraan zie je dit? Wat is het verschil met de vorige uitvoer van dit commando?

We zien dat het adres bij poort `3306` veranderd is van `127.0.0.1` naar `0.0.0.0`. MySQL luistert dus nu naar alle beschikbare netwerk interfaces.

| ![Output van de luisterence TCP sockets na aanpassen bind-adres](./img/2-databankserver/listening-sockets.png) |
| :------------------------------------------------------------------------------------------------------------: |
|                Figuur 3. Output van de luisterende TCP sockets na aanpassen van het bind-adres                 |

### Uitbreidingen

#### 1. Schakel de screen lock uit.

1. Open de instellingen in Ubuntu.
2. Ga naar Privacy > Screen Lock.
3. Schakel de screen lock uit.

   | ![Screenshot VM instellingen](./img/2-databankserver/ScreenBlankNever.png) |
   | :------------------------------------------------------------------------: |
   |                   Figuur 4. Automatic screen lock = off.                   |

#### 2. Laat de gebruiker osboxes.org automatisch inloggen.

1. Open de instellingen in Ubuntu.
2. Ga naar Users.
3. Schakel Automatic Login in.

   | ![Screenshot VM instellingen](./img/2-databankserver/AutomaticLogin.png) |
   | :----------------------------------------------------------------------: |
   |                     Figuur 5. Automatic login = on.                      |

   | Figuur 3. Automatic login = on. |

#### 3. Installeer handige applicaties zoals Visual Studio Code.

1. Open ubuntu software.
2. Zoek naar Visual Studio Code.
3. Installeer Visual Studio Code.

   | ![Screenshot VM instellingen](./img/2-databankserver/VisualStudioCode.png) |
   | :------------------------------------------------------------------------: |
   |                Figuur 6. Visual Studio Code geïnstalleerd.                 |

#### 4. Pas het wachtwoord van de gebruiker osboxes aan. Schrijf dit wachtwoord zeker op in de beschrijving van de VM via Settings > General > Description.

1. Open instellingen in Ubuntu.
2. Ga naar Users.
3. Klik op Password.
4. Vul het nieuwe wachtwoord in.

   | ![Screenshot VM instellingen](./img/2-databankserver/ChangePassword.png) |
   | :----------------------------------------------------------------------: |
   |                     Figuur 7. Wachtwoord veranderen.                     |

#### 5. Probeer of je met FileZilla/Cyberduck bestanden van/naar de VM kan kopiëren. Dit zal extra configuratie vereisen.

1. Installeer een FTP-server op de VM.

```bash
sudo apt update
sudo apt install vsftpd
```

2. Configureer de FTP-server.

```bash
sudo nano /etc/vsftpd.conf
```

3. Zorg ervoor dat de volgende regels in het bestand staan:

```
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
```

4. Herstart de FTP-server.

```bash
sudo systemctl restart vsftpd
```

5. Open filezilla en maak een nieuwe verbinding aan met de VM.

- Ga naar sitebeheer (ctrl + s) > nieuwe site en vul de gegevens in.

  | ![Locatie site manager](./img/2-databankserver/Filezilla/FileZillaStap4.1.png) |
  | :----------------------------------------------------------------------------: |
  |                        Figuur 8. Locatie site manager.                         |

- Vul het IP-adres, de gebruikersnaam en het wachtwoord in zoals in figuur 8.

  | ![Gegevens site manager](./img/2-databankserver/Filezilla/FileZillaStap4.2.png) |
  | :-----------------------------------------------------------------------------: |
  |                        Figuur 9. Gegevens site manager.                         |

- Bij een succesvolle verbinding zou je bestanden van/naar de VM moeten kunnen kopiëren. En zou je response 230 moeten krijgen zoals in figuur 9.

  | ![Succesvolle verbinding](./img/2-databankserver/Filezilla/FileZillaStap5.1.png) |
  | :------------------------------------------------------------------------------: |
  |                        Figuur 10. Succesvolle verbinding.                        |

  > Nu kan je succesvol bestanden van/naar de VM kopiëren.

#### 6. Configureer de VM zodat je via SSH kan inloggen vanop je fysieke systeem (via een wachtwoord en/of public/private keypair).

1. Installeer een SSH-server op de VM.

```bash
sudo apt update
sudo apt install openssh-server
```

2. Configureer de SSH-server.

```bash
sudo nano /etc/ssh/sshd_config
```

3. Zorg ervoor dat de volgende regels in het bestand staan:

```
PasswordAuthentication yes
PubkeyAuthentication yes
```

4. Herstart de SSH-server.

```bash
sudo systemctl restart ssh
```

5. Voeg je lokale public-key toe aan de VM authorized_keys.

- Breng je public key over via FileZilla naar je VM.
- Voeg je public key toe aan `~/.ssh/authorized_keys`.

  - Indien `authorized_keys` nog niet bestaat, maak je eerst een nieuw tekstbestand aan met die naam.

  > Nu kan je via de terminal inloggen op je virtuele machine via
  > `ssh osboxes@192.168.56.20`

## Evaluatiecriteria

Toon na afwerken het resultaat aan je begeleider. Elk teamlid moet in staat zijn om het resultaat te demonstreren bij de oplevering van deze opdracht! Criteria voor beoordeling:

- [x] De VM start op en je kan inloggen:
  - [x] De VM heeft een host-only adapter en een NAT adapter met de correcte instellingen.
  - [x] Je kan pingen vanop je fysieke systeem naar de host-only adapter van de VM.
  - [x] Je kan aantonen dat MySQL actief is op de VM en luistert op alle interfaces.
- [x] Je kan MySQL Workbench gebruiken om een connectie aan te maken met de databankserver:
  - [x] Je hebt een **werkende** connectie voor de admin-gebruiker
  - [x] Je hebt een **werkende** connectie voor de applicatie-gebruiker
- [x] Je hebt een verslag gemaakt op basis van het template.
- [ ] De cheat sheet werd aangevuld met nuttige commando's die je wenst te onthouden voor later.

## Problemen en oplossingen

Geen problemen ondervonden.

## Voorbereiding demo

### Na opstart VM en in te loggen:

#### De VM heeft een host-only adapter en een NAT adapter met de correcte instellingen.

Settings > Network
![Host-only adapter](./img/2-databankserver/host-only-adapter.png)
![NAT interface](./img/2-databankserver/NAT-interface.png)

#### Pingen vanop fysieke systeem naar de host-only adapter van de VM.

`ping 192.168.56.20` in CLI fysieke systeem wanneer VM draait.

#### Aantonen dat MySQL actief is op de VM en luistert op alle interfaces.

Aantonen dat MySQL actief is: `systemctl status mysql`.
![Status MySQL](./img/2-databankserver/mysql-status.png)
Aantonen dat MySQL luistert op alle interfaces: `ss -tlnp` en constateren dat het adres `0.0.0.0` is bij poort 3306.
![ss -tnlp check](./img/2-databankserver/ss-tnlp.png)

### MySQL Workbench gebruiken om een connectie aan te maken met de databankserver:

#### Werkende connectie voor de admin-gebruiker en de applicatie-gebruiker.

Connections testen met rechtermuisknop op de connecties > Edit Connection... > Test Connection

![Admin connection success](./img/2-databankserver/admin-connection-success.png)
![Appusr connection success](./img/2-databankserver/appusr-connection-success.png)

## Reflecties

De meeste stappen waren vrij eenvoudig om te volgen. Soms moesten we wel wat opzoekwerk doen om de juiste commando's te vinden en te begrijpen wat sommige termen betekenen.

## Bronnen

https://www.sciencedirect.com/topics/computer-science/loopback-address#:~:text=The%20loopback%20address%2C%20also%20called,01.

https://tecadmin.net/mysql-allow-remote-connections/#:~:text=If%20the%20bind%2Daddress%20parameter,only%20listening%20on%20the%20localhost.&text=Change%20the%20bind%2Daddress%20value,listen%20on%20all%20network%20interfaces.

https://www.linux.com/topic/networking/introduction-ss-command/

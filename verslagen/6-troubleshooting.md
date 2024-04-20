# Verslag: SUBJECT

> Naam verslaggever: NAME

## Beschrijving

Het doel van de opdracht is dat we kunnen omgaan met het optreden van fouten. We moeten logs kunnen lezen en begrijpen, en zo het probleem oplossen.

## Evaluatiecriteria

Toon na afwerken het resultaat aan je begeleider. Elk teamlid moet in staat zijn om het resultaat te demonstreren bij de oplevering van deze opdracht! Criteria voor beoordeling:

- [x] Er is een volledig werkende virtuele machine volgens de eindsituatie.
- [x] Je hebt een verslag gemaakt op basis van het template.
  - [x] Het verslag bevat een duidelijke beschrijving van de problemen die je hebt gevonden mét de oplossingen. **Per type machine is er een aparte beschrijving!**
- [x] De cheat sheet werd aangevuld met nuttige commando's die je wenst te onthouden voor later.

## Problemen en oplossingen

### Machine 1

- Webserver:
  - Apache is nog niet aangezet, doe dit door eerst `sudo systemctl enable apache2` uit te voeren en daarna `sudo systemctl restart apache2` uit te voeren.
- Databankserver:
  - De databank is bereikbaar voor elke machine via TCP en SSH. Om TCP connecties te blokkeren pas je in het `/etc/mysql/mysql.conf.d/mysqld.cnf`-bestand het `bind-address` aan van `0.0.0.0` naar `127.0.0.1`. Daarna restart je de sql-service met `sudo systemctl restart mysql.service`.
- Wordpress:
  - Wordpress kan geen connectie maken met de database omdat `wpuser` nog niet is aangemaakt. Doe dit door volgende commando's uit te voeren:
  ```mysql
  create user 'wpuser'@'%' identified by 'letmein!';
  grant all privileges on *.* to 'wpuser'@'%';
  flush privileges;
  exit;
  ```
- Vaultwarden:
  - Vaultwarden werd opengesteld op poort `80`, dit moet poort `4123` zijn.
  - In de environment wordt bij de `ROCKET_TLS` een variabele `folder_vaultwarden` gebruikt bij het pad, deze variabele bestaat niet en om het pad te vervolledigen vervang je dit door `/opt`.
- Portainer:
  - Het volume staat in omgekeerde volgorde ingesteld (namelijk `/data:portainer_data`), dit moet aangepast worden naar `portainer_data:/data`.
- Planka:
  - In de environment staat er een variabele leeg ingesteld (namelijk `- # SECRET_KEY=...`), dit moet aangepast worden naar `- SECRET_KEY=...`

```
sudo dpkg-reconfigure keyboard-configuration
sudo reboot
sudo nano /etc/netplan/01-network-manager-all.yaml
addresses: - 192.168.56.56/24 > - 192.168.56.20/24
sudo netplan apply

============================== Webserver ==================================
sudo systemctl enable apache2
sudo systemctl restart apache2
===========================================================================

============================== Databanserver ==============================
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
bind-address = 0.0.0.0 > bind-address = 127.0.0.1
sudo systemctl restart mysql.service
===========================================================================

============================== Wordpress ==================================
mysql -u admin -p
create user 'wpuser'@'%' identified by 'letmein!';
grant all privileges on *.* to 'wpuser'@'%';
flush privileges;
exit;
===========================================================================

docker compose -f docker/docker-compose.yml down
sudo nano docker/docker-compose.yml

============================== Vaultwarden ================================
ports: - 80:80 > - 4123:80
environment: - ROCKET_TLS={certs="${folder_vaultwarden}/keys/vaultwarden.crt",key="${folder_vaultwarden}/keys/vaultwarden.key"} > - ROCKET_TLS={certs="/opt/keys/vaultwarden.crt",key="/opt/keys/vaultwarden.key"}
===========================================================================

============================== Portainer ==================================
volumes: - /data:portainer_data > - portainer_data:/data
===========================================================================

docker compose -f docker/docker-compose.yml up -d
sudo nano docker/planka/docker-compose.yml

============================== Planka =====================================
environment: - # SECRET_KEY=... > - SECRET_KEY=...
===========================================================================

docker compose -f docker/planka/docker-compose.yml restart
```

### Machine 2

### Machine 3

### Machine 4

### Machine 5

## Reflecties

Het troubleshooten verliep vrij vlot. Ik heb toegepast wat we voorgaande opdrachten hebben geleerd om zo de machine te doen werken.

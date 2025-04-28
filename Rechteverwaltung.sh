#!/bin/bash

# Gruppen erstellen
sudo groupadd web-admins
sudo groupadd backup-users

# Benutzer erstllen
sudo useradd -m benutzer1
sudo useradd -m benutzer2
sudo useradd -m benutzer3
sudo useradd -m benutzer4

# Benutzer in die erstellten Gruppen hineinfügen
sudo usermod -aG web-admins benutzer1
sudo usermod -aG web-admins benutzer2
sudo usermod -aG backup-users benutzer3
sudo usermod -aG backup-users benutzer4

# Verzeichnisse erstellen
sudo mkdir -p /var/www/html/
sudo mkdir -p /backups/

# Berechtigungen
sudo chown -R :web-admins /var/www/html/
sudo chown -R :backup-users /backups/

sudo chmod 770 /var/www/html/
sudo chmod 770 /backups/

echo "Gruppen mit jeweiligen Benutzern erfolgreich eingerichtet."

exit 0

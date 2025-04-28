#!/bin/bash

# Temporäre Datei für Log erstellen
TEMP_FILE=$(mktemp)
trap "rm -f $LOG_FILE" EXIT

echo "Starte Webserver-Setup.." | tee $TEMP_FILE

# Apache2 installieren
echo "Installiere Apache2.." | tee -a $TEMP_FILE
sudo apt update
sudo apt install -y apache2

# Apache2 starten
echo "Starte Apache.." | tee -a $TEMP_FILE
sudo systemctl start apache2

# Webseite bereitstellen
echo "Bereitstellen der Webseite..." | tee -a $TEMP_FILE
TARGET_DIR="/var/www/html"
sudo mkdir -p $TARGET_DIR
sudo mv index.html style.css $TARGET_DIR

# Berechtigungen setzen
echo "Setze Berechtigungen für $TARGET_DIR..." | tee -a $TEMP_FILE
sudo chown www-data:www-data $TARGET_DIR
sudo chmod 755 $TARGET_DIR

# Apache2-Status überprüfen
echo "Prüfe den Status von Apache2.." | tee -a $TEMP_FILE
sudo systemctl status apache2 | tee -a $TEMP_FILE

echo "Setup erfolgreich abgeschlossen. Öffne deinen Browser und rufe die IP-Adresse auf, um die Webseite zu testen. Du hast es geschafft ;)" | tee -a $TEMP_LOG

exit 0
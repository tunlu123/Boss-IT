#!/bin/bash

# Backup-Verzeichnis
BACKUP_DIR="/backups"
mkdir -p $BACKUP_DIR

# Berechtigungen setzen
chmod 755 $BACKUP_DIR  
echo "Berechtigungen für $BACKUP_DIR wurden gesetzt."

# Datum und Uhrzeit
datum=$(date +"%Y-%m-%d_%H-%M")

# Backup-Dateiname
BACKUP_FILE="$BACKUP_DIR/backup_$datum.zip"

# Temporäre Log-Datei
TEMP_LOG=$(mktemp)
trap "rm -f $TEMP_LOG" EXIT

echo "Erstelle einen Backup.." | tee $TEMP_LOG
zip -r $BACKUP_FILE /var/www/html

echo "Backup erfolgreich erstellt: $BACKUP_FILE" | tee -a $TEMP_LOG

exit 0

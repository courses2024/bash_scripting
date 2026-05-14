#!/bin/bash

timestamp_to_secs() {
  # Funktion, die als Argument eine Zeit im Format hh:mm:ss erhält 
  # Sie extrahiert daraus Stunden (hh), Minuten (mm) und Sekunden (ss)
  # und gibt die Gesamtzeit in Sekunden zurück. Führende Nullen werden entfernt, 
  # um die Berechnung korrekt durchzuführen.

  IFS=':' read -r hh mm ss <<< "$1"
  # Entferne führende Nullen vor der Berechnung
  hh=${hh#0}
  mm=${mm#0}
  ss=${ss#0}
  echo $((hh * 3600 + mm * 60 + ss))
}

if [ -z "$1" ]; then
  echo "Bitte geben Sie den Namen des Logfiles an."
  exit 1
fi
logfile=$1

# erster Timestamp
first_ts=$(head -1 $logfile | awk '{print $20}')
# zweiter Timestamp
second_ts=$(tail -1 $logfile | awk '{print $20}')
echo "14:00:00 -> $(timestamp_to_secs $first_ts) Sekunden"
echo "14:30:01 -> $(timestamp_to_secs $second_ts) Sekunden"
echo "Differenz: $(( $(timestamp_to_secs $second_ts) - $(timestamp_to_secs $first_ts) )) Sekunden"

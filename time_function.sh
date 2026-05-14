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
first_time="14:00:00"
second_time="14:30:01"
# Beispielaufrufe
echo "14:00:00 -> $(timestamp_to_secs $first_time) Sekunden"
echo "14:30:01 -> $(timestamp_to_secs $second_time) Sekunden"
echo "Differenz: $(( $(timestamp_to_secs $second_time) - $(timestamp_to_secs $first_time) )) Sekunden"

#!/bin/bash

# Überprüfe, ob der Benutzer einen Parameter übergeben hat
if [ -z "$1" ]; then
  echo "Bitte geben Sie den Pfad zum Logfile an."
  exit 1
fi

logfile=$1

# Definieren Sie die Dauer der Sequenz in Sekunden
interval_seconds=30  # Ändern Sie diesen Wert, um die gewünschte Dauer zu setzen

# Definieren Sie den Prozentwert von idle
idle_threshold=20  # Ändern Sie diesen Wert, um den gewünschten Prozentwert von idle zu setzen

# Initialisiere Variablen
in_sequence=false
start_time=""
end_time=""

while IFS= read -r line; do
  # Extrahieren Sie den idle_value mit awk
  idle_value=$(echo "$line" | awk '{print $15}')

  # Überprüfe, ob der idle_value kleiner als die Schwellwert ist
  if (( idle_value < idle_threshold )); then
    if ! $in_sequence; then
      # Starte eine neue Sequenz
      in_sequence=true
      start_time=$(echo "$line" | awk '{print $19 " " $20}')
      seconds_elapsed=0  # Reset der Sekundenzähler
    else
      ((seconds_elapsed++))
    fi
    
  else  # idle_value liegt über idle_threshold
    if $in_sequence && (( seconds_elapsed >= interval_seconds )); then
      # Ende der Sequenz erreicht
      end_time=$(echo "$line" | awk '{print $19 " " $20}')
      printf 'Start: %s, End: %s (Duration: %d seconds)\n' "$start_time" "$end_time" "$seconds_elapsed"
      in_sequence=false
      seconds_elapsed=0
    fi
  fi

done < $logfile


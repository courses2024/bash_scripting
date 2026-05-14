#!/bin/bash

# Überprüfen, ob das Logfile angegeben wurde
if [ -z "$1" ]; then
  echo "Bitte geben Sie den Namen des Logfiles an."
  exit 1
fi

logfile=$1

# Gesamteranzahl der Failed password Meldungen
export total=$(grep "Failed password" $logfile | wc -l)
echo $total lines with '"Failed password"' found

# Berechnung und Ausgabe der Anteile in Prozent
grep "Failed password" $logfile |
 awk '{print $(NF-3)}' |                           
 sort |                                            
 uniq -c |                                         
 sort -nr |                                        
 head -n 10 | 
 awk -v total=$total '{printf "%5d %-15s %6.2f%%\n", $1, $2, $1*100/total}'

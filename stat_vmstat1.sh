#!/bin/bash

logfile=${logfile:=$1}

#Zähle, wie viele Zeilen die Datei enthält
Zeilen=$(wc -l < $logfile)
echo "Anzahl Zeilen: $Zeilen"

#Zähle alle Zeilen, in denen r (Der erste Wert pro Zeile) = 0 ist
r_zero=$(grep '^ *0 ' $logfile | wc -l)
echo "Anzahl Zeilen mit r = 0: $r_zero"

#Zähle alle Zeilen, in denen r (Der erste Wert pro Zeile) größer als 0 ist
r_nonzero=$(grep '^ *[1-9][0-9]* ' $logfile | wc -l)
echo "Anzahl Zeilen mit r > 0: $r_nonzero"

# Sortiere die Datei nach der höchsten User-CPU-Belastung, us (13. Spalte) und gib nur die 10 größten Werte aus
sort -k13 -nr vmstat.log | head -10

# Sortiere den Inhalt der  Datei numerisch aufsteigend nach free (4. Spalte) i
# und gib die 10 Zeilen mit den kleinsten free-Werten sortiert aus
sort -k4 -n  vmstat.log | head -10

# Zähle die Zeilen, in denen der Wert in der 'idle' spalte unter 20% liegt
awk '$15 < 20' $logfile | wc -l 


# Zeige die Zeilen, in denen der Wert in der 'idle' spalte unter 20%, aber über 0%  liegt und
# gebe de idle-wert, den Tag und die Uhrzeit aus
awk '$15 < 20 && $15 > 0 {print $13,$14,$15,$19,$20}' $logfile 



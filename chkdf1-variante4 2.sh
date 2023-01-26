#!/bin/bash     
# chkdf1-variante4.sh : Variante zu chkdf1.sh
#description    :Auswertung des Outputs von df -k, Alarm, wenn ein Schwellwert 
#                für den Füllungsgrad eines der Dateisysteme überschritten wurde
#date           :20181123
#version        :1.0    
#notes          :Variante zu chkdf1 mit for-Schleife, awk und Bash-Parameterexpansion
#bash_version   :4.4.12(1)-release
#============================================================================


# Der Schwellwert in % wird dem Skript als einziger Parameter übergeben
schwellwert=$1

# Schleife über alle Zeilen in der Ausgabe des Kommandos  df -k 
# tr löscht überzählige Leerzeichen, awk liefert die Spalten 5 und 6
# die Trennung der Spalten erfolgt mit der Variablenexpansion
# beim %-Zeichen

for zeile in $( df -k | tail -n+2 | awk '{print $5 $6}')
do
    # ${VARIABLE#MUSTER} entfernt MUSTER vom Anfang des Textes in VARIABLE
    mountpoint=${zeile#*\%}
    # ${VARIABLE%MUSTER} entfernt MUSTER vom Ende des Textes in VARIABLE
    # Das Zeichen % muss mit \ maskiert werden
    pct_full=${zeile%\%*}
    if [ $pct_full -ge $schwellwert ]
    then
        echo "Füllungsgrad von $mountpoint ist $pct_full Prozent"
    fi
done

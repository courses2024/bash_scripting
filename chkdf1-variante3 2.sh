#!/bin/bash     
# chkdf1-variante3.sh : Variante zu chkdf1.sh
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
# tr löscht überzählige Leerzeichen, cut liefert die Spalten 5 und 6
# die erste Zeile und das %-Zeichen werden mit sed enfernt
for zeile in $( df -k | tr -s ' ' | cut -d' ' -f5,6 | sed -n '2,$ s/% /:/ p')
do
    # ${VARIABLE#MUSTER} entfernt MUSTER vom Anfang des Textes in VARIABLE
    mountpoint=${zeile#*:}
    # ${VARIABLE%MUSTER} entfernt MUSTER vom Ende des Textes in VARIABLE
    pct_full=${zeile%:*}
    if [ $pct_full -ge $schwellwert ]
    then
        echo "Füllungsgrad von $mountpoint ist $pct_full Prozent"
    fi
done

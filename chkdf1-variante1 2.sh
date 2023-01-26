#!/bin/bash     
# chkdf1-variante1.sh : Variante zu chkdf1.sh
#description    :Auswertung des Outputs von df -k, Alarm, wenn ein Schwellwert 
#                für den Füllungsgrad eines der Dateisysteme überschritten wurde
#date           :20181123
#version        :1.0    
#notes          :Variante zu chkdf1
#bash_version   :4.4.12(1)-release
#============================================================================


# Der Schwellwert in % wird dem Skript als einziger Parameter übergeben
schwellwert=$1

# Schleife über alle Zeilen in der Ausgabe des Kommandos
# df -k, %-Zeichen mit tr entfernt, Überschrift mit tail entfernt
# statt der 2 Variablen hinter read wird nur eine Variable verwendet
# diese ist ein Array und die einzelnen Spalten sind nun über
# die Werte in spalten_array[0] und spalten_array[1] verfügbar

declare -a spalten_array
df -k --output=pcent,target | tr -d '%' | tail -n+2 | while read -a spalten_array
do
    if [ ${spalten_array[0]} -ge $schwellwert ]
    then
        echo "Füllungsgrad von  ${spalten_array[1]} ist ${spalten_array[0]} Prozent"
    fi
done

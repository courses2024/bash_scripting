#!/bin/bash     
#anlyze-step2.sh : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
#bash_version   :4.4.12(1)-release
#============================================================================

# die Ausgabe von vmstat -n -t -S M 1 | tr -s " " wurde in einer Datei vmstat.log gespeichert

# Vorläufig wird der Dateiname fix codiert
# 2do : Variablen Dateinamen mit -f angeben
inputfile=vmstat.log

# Die Zeilen der Datei lesen
while read zeile
do
    # 2do : Wert der Spalten 15 (cpu idle %), 18 (Datum) und 19 (Uhrzeit)
    #       separat in Variablen speichern und auswerten.
    #       Das kann mit vielen verschiedenen Mitteln gelöst werden, z.B.
    #       cut, sed, awk ....
    #       hier wird es mit einem Array gelöst:
    
    # z_array bekommt alle  Spalten von zeile als Elemente zugewiesen
    z_array=($zeile)
    # Jetzt kann jede Spalte separat über den Array-Index angesprochen werden
    date=${z_array[17]}
    time=${z_array[18]} 
    value=${z_array[14]}
    # 2do : Vergleich der Zeitstempel der Zeilen und Bilden der Zeitdifferenz 
    #       in Sekunden. Hier werden zunächst einfach die Werte 
    #       $date, $time und $value zum Testen ausgegeben
    echo $date $time $value
done < $inputfile

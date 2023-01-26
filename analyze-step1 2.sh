#!/bin/bash     
# analyze-step1.sh : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
#date           :20181112
#version        :1.0    
#notes          :       
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
    #       In dieser Version wird einfach die gesamte Zeile ausgegeben
    echo $zeile
done < $inputfile

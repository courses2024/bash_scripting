#!/bin/bash     
# analyze-step5: Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
#bash_version   :4.4.12(1)-release
#============================================================================

# die Ausgabe von vmstat -n -t -S M 1 | tr -s " " wurde in einer Datei vmstat.log gespeichert

inputfile=./vmstat.log # Default Wert, wenn keine andere Datei mit -f angegeben wurde
timestamp=0;           # Variable für den Zeitstempel in Sekunden

# Optionen auf der Kommandozeile auswerten
# In dieser Version wird nur die Option -f inputfile genutzt
while getopts f:i:lg opt 2>/dev/null
do
    case $opt in
        f) inputfile=$OPTARG ;;
        ?) echo "Unbekannte Option" 
           exit 1
           ;;
    esac
done

# Die Zeilen der Datei lesen
while read zeile
do
    # z_array bekommt alle  Spalten von zeile als Elemente zugewiesen
    z_array=($zeile)

    # Jetzt kann jede Spalte separat über den Array-Index angesprochen werden
    date=${z_array[17]}
    time=${z_array[18]} 
    value=${z_array[14]}

    # Datums-String in Sekunden seit 01.01.1970 00:00:00 GMT umwandeln
    # Beispiel: date -d "2018-08-24 14:51:39" +%s ergibt:  1535115099
    datetime="$date $time"
    old_timestamp=$timestamp
    timestamp=$(date -d"$datetime" +%s)

    # Differenz des timestamp zu einem vorher gespeicherten Wert
    let sekunden=$timestamp-$old_timestamp
    echo $timestamp $value $sekunden
done < $inputfile

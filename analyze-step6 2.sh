#!/bin/bash     
# analyze-step6 : Auswertung der Spalten CPU idle, Datum und Uhrzeit in der Ausgabe von Vmstat
#bash_version   : 4.4.12(1)-release
#============================================================================

# die Ausgabe von vmstat -n -t -S M 1 | tr -s " " wurde in einer Datei vmstat.log gespeichert

inputfile=./vmstat.log # Default Wert, wenn keine andere Datei mit -f angegeben wurde
timestamp=0;           # Variable für den Zeitstempel in Sekunden
start_timestamp=0;     # Zeitstempel für den Beginn einer Über/Unterschreitung des Schwellwerts
schwellwert=20
intervall=10
sekunden=0
schwelle_erreicht="n"

# Optionen auf der Kommandozeile auswerten
# In dieser Version wird nur die Option -f inputfile genutzt
while getopts f:i:lg opt 2>/dev/null
do
    case $opt in
        f) inputfile=$OPTARG 
           ;;
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
    timestamp=$(date -d"$datetime" +%s)

    # 
    # 2do: Wenn für mehr als 10 aufeinanderfolgende Sekunden der Wert von „idle“ unter 20 liegt, 
    # geben Sie das Datum und die Uhrzeit des Beginns dieses Zeitabschnitts und seines Endes aus.
    # 

    if [ $value -lt $schwellwert ]
    then
        # Wird der Schwellwert in dieser Zeile unterschritten, merken wir uns das
        schwelle_erreicht="y"
        if [ $start_timestamp -eq 0 ]
        then
            # wenn $start_timestamp = 0, ist dies die erste Unterschreitung
            start_timestamp=$timestamp
            start_timestring=$datetime
        fi
        let sekunden=$timestamp-$start_timestamp
    else
        # Keine Unterschreitung oder Unterschreitung vorbei
        end_timestring=$datetime
        if [ "$schwelle_erreicht"=="y" ] && [ $sekunden -gt $intervall ]
        then
            echo Schwellwert $schwellwert von $start_timestring bis $end_timestring unterschritten
        fi
        schwelle_erreicht="n"
        start_timestamp=0
        sekunden=0
    fi


    
done < $inputfile

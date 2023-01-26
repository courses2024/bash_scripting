#!/bin/bash
# chkdf2_step2.sh : 2. Schritt zur Aufgabe chkdf2.sh

# Teil1: Config File chkdf.cfg lesen und assoziatives Array füllen
declare -A confarray
# Das File chkdf.cfg hat zwei Spalten: mountpoint und Schwellwert
while read key value
do
    # In key steht der mountpoint, in value der Schwellwert
    confarray[$key]=$value    
done < chkdf.cfg

# Teil2: for-schleife über alle Array-Keys
for mountpoint in ${!confarray[@]}
do
    # maxpct ist der Schwellwert aus dem config file
    maxpct=${confarray[$mountpoint]}
    # ispct ist der Output von df für diesen mountpoint
    ispct=$(df --output=pcent $mountpoint | tr -d '%' | tail -n+2)
    # Ist der Output von df für $mountpoint grösser als der Schwellwert?
    if [ $ispct -gt $maxpct ]
    then
        echo Schwellwert ${maxpct}% für $mountpoint überschritten
    fi
done


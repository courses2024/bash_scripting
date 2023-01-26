#!/bin/bash
# vergleiche0.sh : Prüft die Parameter auf = > und > 
#               ohne die Prüfung, ob beide Parameter eine
#               Zahl sind. Vollständige Lösungen in : vergleiche2
#               bis vergleiche4
# Version     : 1.0
# Datum       : 16.04.2019
# #######################################################

if [ $1 -eq $2 ]
then
    echo $1 und $2 sind gleich
else
    if [ $1 -gt $2 ]
    then
        echo $1 ist grösser als $2
    else
        echo $1 ist kleiner als $2
    fi
fi

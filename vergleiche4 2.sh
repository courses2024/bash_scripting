#!/bin/bash
# vergleiche4.sh : Weitere Version des Skripts "vergleiche"

# Hat der Benutzer 2 Argumente angegeben?
if  [ $# -ne 2 ]
then
	echo Aufruf: vergleiche zahl1 zahl2
	exit 1
fi

# Verknüpfung der 2 Prüfungen, ob $1 ODER $2 keine ganze Zahl enthält
if ! [ $1 -eq $1 ] 2>/dev/null || ! [ $2 -eq $2 ] 2>/dev/null 
then
	echo Kann $1 und $2 nicht vergleichen
    exit 2
fi


# Jetzt kommt der eigentliche Vergleich 
if [ $1 -gt $2 ]
then
	echo "$1 ist grösser als $2"
elif [ $1 -lt $2 ]
then
	echo "$1 ist kleiner als $2"
else
	echo "$1 ist gleich $2"
fi

exit 0

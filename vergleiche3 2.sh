#!/bin/bash
# vergleiche3.sh : Weitere  Version von "vergleiche"

# Überprüfung der Parameter wie in Version 1:

# Variante statt: [ $# -ne 2 ]
if ! [ $# -eq 2 ]
then
	echo Aufruf: vergleiche zahl1 zahl2
	exit 1
fi

# Prüfung, ob $1 ODER $2 keine ganze Zahl ist
if ! [ $1 -eq $1 ] || ! [ $2 -eq $2 ]  2>/dev/null
then
	echo Kann $1 und $2 nicht vergleichen
    echo Verwendung: vergleiche ganzeZahl1 ganzeZahl2
    exit 2
fi


# Die drei Prüfungen, in einer if ... then ... elif ... then ... else ... fi
# Anweisung zusammengezogen

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

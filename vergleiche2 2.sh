#!/bin/bash
# vergleiche2.sh : Alternative  Version zu vergleiche1.sh

# Diverse Prüfungen, ob der Aufruf korrekt war. Wenn nein, 
# Fehlermeldung und Abbruch mit exit 1:

# 1. Prüfung, ob 2 Parameter angegeben wurden
if [ $# -ne 2 ]
then
	echo Aufruf: vergleiche zahl1 zahl2
	exit 1
fi

# 2. Prüfung, ob Parameter 1 eine ganze Zahl ist mit "Gleichheits-Trick"
if ! [ $1 -eq $1 ] 2>/dev/null
then
	echo Kann $1 und $2 nicht vergleichen
    exit 1
fi

# 3. Prüfung, ob Parameter 2 eine ganze Zahl ist mit "Gleichheits-Trick"
if ! [ $2 -eq $2 ] 2>/dev/null
then
	echo Kann $1 und $2 nicht vergleichen
    exit 1
fi

# Die eigentliche Funktion des Skripts: ist $1 grösser, kleiner oder gleich $2
# Zwei Prüfungen, Ausgabe und Ende mit exit 0

if [ $1 -gt $2 ]
then
	echo "$1 ist grösser als $2"
	exit 0
fi

if [ $1 -lt $2 ]
then
	echo "$1 ist kleiner als $2"
	exit 0
fi

# Jetzt bleibt nur noch der Fall dass beide gleich sind
echo "$1 ist gleich $2"
exit 0

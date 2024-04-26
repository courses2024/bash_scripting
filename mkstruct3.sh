#!/bin/bash
# mkstruct3.sh : Version mit Positionsparameter
# nutzt den 1. Positionsparameter für den Kursnamen und den Speicherort
# und einen Default-Wert, falls er nicht angegeben wurde

# Wenn $1 leer ist, nehme den Inhalt von KURSNAME
KURSNAME=${1:-$KURSNAME}
# Wenn KURSNAME leer ist, nehme den Default-Namen "Kurs"
KURSNAME=${KURSNAME:-Kurs}

mkdir ${KURSNAME}
mkdir ${KURSNAME}/block1
mkdir ${KURSNAME}/block1/aufgaben
mkdir ${KURSNAME}/block1/loesungen
cp -R ${KURSNAME}/block1 ${KURSNAME}/block2
cp -R ${KURSNAME}/block1 ${KURSNAME}/block3
cp -R ${KURSNAME}/block1 ${KURSNAME}/block4
cp -R ${KURSNAME}/block1 ${KURSNAME}/block5




#!/bin/bash
# subshell_falle2.sh : zeigt die PID der Subshell nach |
export zeilen=0
echo Zunächst Shell $BASHPID
cat textdatei | while read zeile
do

    [ $zeilen -eq 0 ] && echo jetzt in der Subshell Nr. $BASHPID
    let zeilen=zeilen+1
    echo $zeilen $zeile
done
echo Wieder in Shell $BASHPID
echo $zeilen gelesen

#!/bin/bash     
# rechner.sh : Ein Kommandozeilen-Rechner. Demonstriert Zusammenspiel case und while
#date           :20180925
#version        :1.0    
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

echo
echo ------------------------------------------------------------------------------------
echo "rechner liest 2 ganze Zahlen und eine Rechenoperation ein und liefert das Ergebnis"
echo "Gültige Operationen: +, -, x, * /, %, mod"
echo "Beispiele: 1 + 9 oder 22 x 10 oder 100 / 4"
echo "Verlassen mit ENDE"
echo ------------------------------------------------------------------------------------
echo

while read wert1 op wert2
do
    # Bei Eingabe von ENDE Schleife beenden
    [ $wert1 = "ENDE" ] && break

    # Prüfung auf ganzzahlige Werte
    if ! [ $wert1 -eq $wert1 ] 2>/dev/null || ! [ $wert2 -eq $wert2 ] 2>/dev/null
    then
        echo "Nur ganze Zahlen erlaubt"
        # Sprung zurück zum read
        continue
    fi

    # Berechnung durchführen
    case $op in
        +)        let ergebnis=$wert1+$wert2 ;;
        -)        let ergebnis=$wert1-$wert2 ;;
        x|X|*)      let ergebnis=$wert1*$wert2 ;;
        /)        let ergebnis=$wert1/$wert2 ;;
        %|mod)    let ergebnis=$wert1%$wert2 ;;
        *)        ergebnis="Unbekannte Operation"
    esac

    # Ausgabe
    echo $ergebnis
done

#!/bin/bash
################################################################################
#                       Modulprüfung LUIT Februar 2021                         #
#                               aufgabe-04.sh                                  #
#                  Kommando vmstat, Filtern von Kommando-Ausgaben              #
################################################################################
#                                                                              #
# Aufgabenstellung                                                             #
#  Das Kommando vmstat gibt Performance-Statistiken aus. Informieren Sie sich  #
#  Mit man vmstat , probieren sie das Kommando aus und erstellen Sie ein       #
#  Kommandozeile, die folgende  Anforderungen erfüllt:                         #
#  a) Die Statistiken werden wiederholt einmal pro Sekunde ausgegeben          #
#  b) Die Anzahl Wiederholungen und damit die Anzahl Zeilen, die ausgegeben    #
#     werden sollen, werden dem Script als 1. Argument übergeben.              #
#  c) Die Überschriftszeilen am Anfang sollen nicht erscheinen                 #
#  d) Die erste Zeile mit Statistiken soll nicht erscheinen                    #
#  e) Die Überschriften sollen nicht wiederholt ausgegeben werden              # 
#  f) Nur  ein "timestamp" mit  Datum und Uhrzeit und die Zahl in der          #
#     Spalte "id" aus der Rubrik "cpu" soll angegeben werden.                  #
#  g) Die Ausgabe der 3 Spalten soll wie im Beispiel formatiert sein           #
#                                                                              #
# Beispiel:                                                                    #
#  $ ./aufgabe-04.sh 8                                                         #
#  2021-01-31 09:35:01 100                                                     #
#  2021-01-31 09:35:02 100                                                     #
#  2021-01-31 09:35:03 99                                                      #
#  2021-01-31 09:35:04 100                                                     #
#  2021-01-31 09:35:05 89                                                      #
#  2021-01-31 09:35:06 83                                                      #
#  2021-01-31 09:35:07 90                                                      #
#  2021-01-31 09:35:08 100                                                     #
#  $                                                                           #
#                                                                              #
# Hinweise:                                                                    #
#  1. Benennen sie diese Datei nicht um                                        #
#  2. Verwenden Sie Sie keine andere Shell als /bin/bash                       #
#  3. Gehen Sie davon aus, dass dieses Script root-Berechtigung ausgeführt     #
#     wird. Es ist also nicht nötig, vor Kommandos sudo anzugeben.             #
#  4. Die Lösung kann als eine einzelne Kommandozeile geschrieben werden       #
#  5. Es kann einige Sekunden dauern, bis die Ausgabe des Scripts erscheint.   #
#     Haben Sie daher etwas Geduld beim Testen.                                #
################################################################################
#               Geben Sie Ihre Lösung nach diesem Kommentar ein                #
################################################################################


#!/bin/bash
################################################################################
#                       Modulprüfung LUIT Februar 2021                         #
#                              aufgabe-03.sh                                   #
#        Themen: Prozesse, Textzeilen verarbeiten, Ausgaben unterdrücken       #
################################################################################
# Schreiben Sie ein Script, das die unter Hauptfunktionen und Fehlerbehandung  #
# genannten Anforderungen erfüllt:                                             #
#                                                                              #
# Hauptfunktionen                                                              #
#  a) Die Anzahl der laufenden Prozesse eines users wird ausgegeben            #
#     Aufruf: aufgabe-03.sh username                                           #
#  b) Wenn der user existiert, aber keine Prozesse hat, wird 0 ausgegeben      #
#  c) Der Exit-Code soll im in den Fällen a) und b) 0  sein                    #
#  d) Wenn der user nicht existiert, wird nichts ausgegeben und der Exit-Code  #
#     1 wird zurückgegeben                                                     #
#  e) Es sollen keine anderen Ausgaben erscheinen                              #
#                                                                              #
# Fehlerbehandlung:                                                            #
#  f) Es muss genau ein Username angegeben werden. Wenn das nicht der Fall     #
#     ist, wird die folgende Meldung auf stderr ausgegeben:                    #
#       usage: aufgabe-03.sh username                                          #
#  g) Im Fehlerfall wird der Exit-Code 1 zurückgegeben                         #
#                                                                              #
# Beispiele:                                                                   #
#   $ ./aufgabe-03.sh ubuntu                                                   #
#   10                                                                         #
#   $ ./aufgabe-03.sh gnat  # User gnat existiert, keine laufenden Prozesse    #
#   0                                                                          #
#   $ ./aufgabe-03.sh nix  # User nix existiert nicht                          #
#   $ echo $?                                                                  #
#   1                                                                          #
#                                                                              #
# Hinweise:                                                                    #
#  1. Benennen sie diese Datei nicht um                                        #
#  2. Verwenden Sie Sie keine andere Shell als /bin/bash                       #
#  3. Gehen Sie davon aus, dass dieses Script root-Berechtigung ausgeführt     #
#    wird. Es ist also nicht nötig, vor Kommandos sudo anzugeben.              #
################################################################################
#               Geben Sie Ihre Lösung nach diesem Kommentar ein                #
################################################################################
if [ $# -ne 1 ];then
    echo "usage: $(basename $0) username" 1>&2
    exit 1
fi
anzahl=$(ps -u $1 2>/dev/null | wc -l)
if (( anzahl != 0 )); then
   echo $(( anzahl - 1 ))
   exit 0
else
   exit 2
fi


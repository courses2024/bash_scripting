#!/bin/bash
################################################################################
#                       Modulprüfung LUIT Februar 2021                         #
#                              aufgabe-007.sh                                  #
#    Themen: Signale verarbeiten, Funktionen, PID ausgeben, Endlosschleife     #
################################################################################
# Schreiben Sie ein Script, das die unter Hauptfunktionen und Fehlerbehandlung #
# genannten Anforderungen erfüllt:                                             #
#                                                                              #
# Hauptfunktionen                                                              #
#   a) Das Script gibt seine Prozess-ID (PID) auf stdout aus                   #
#   b) Es schreibt seine PID in die Datei /tmp/aufgabe-06-PID                  #
#   c) Es geht dann in eine Endlosschleife. In der Schleife macht es für       #
#      jeden Durchlauf 1 Sekunde Pause.                                        #
#   d) Wenn es die Signale 15 (SIGTERM) oder 2 (SIGINT) zum ersten Mal         #
#      empfängt oder der Benutzer Control-C drückt, gibt es die Meldung        #
#      "Ich räume auf" aus und löscht die Datei /tmp/aufgabe-06-PID            #
#   e) Wenn Signale 15 (SIGTERM) oder 2 (SIGINT) zum zweiten Mal eintreffen    #
#      oder der Benutzer erneut Control-C drückt gibt es "Ich beende mich" aus #
#      und beendet sich.                                                       #
#                                                                              #
# Beispiel:                                                                    #
#   $ ./aufgabe-06.sh &                                                        #
#   [2] 42786                                                                  #
#   42786                                                                      #
#   $ cat /tmp/aufgabe-06-PID                                                  #
#   42786                                                                      #
#   $ kill -15 42786                                                           #
#   Ich räume auf                                                              #
#   $ cat /tmp/aufgabe-06-PID                                                  #
#   cat: '/tmp/aufgabe-06-PID': No such file or directory                      #
#   $ kill -2 42786                                                            #
#   Ich beende mich                                                            #
#   [2]+  Done                    ./aufgabe-06.sh                              #
#                                                                              #
# Hinweise:                                                                    #
#  1. Benennen sie diese Datei nicht um                                        #
#  2. Verwenden Sie Sie keine andere Shell als /bin/bash                       #
#  3. Gehen Sie davon aus, dass dieses Script root-Berechtigung ausgeführt     #
#    wird. Es ist also nicht nötig, vor Kommandos sudo anzugeben.              #
################################################################################
#               Geben Sie Ihre Lösung nach diesem Kommentar ein                #
################################################################################


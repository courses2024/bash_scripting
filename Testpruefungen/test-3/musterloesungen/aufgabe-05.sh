#!/bin/bash
################################################################################
#                       Modulprüfung LUIT Februar 2021                         #
#                              aufgabe-05.sh                                   #
#        Themen: DNS-Server-Einstellungen abfragen, Textausgabe filtern        #  
#                     Beliebig viele Argumente verarbeiten                     #
################################################################################
# Schreiben Sie ein Script, das die unter Hauptfunktionen und Fehlerbehandlung #
# genannten Anforderungen erfüllt:                                             #
#                                                                              #
# Hauptfunktionen                                                              #
#  a) Gibt die Mailserver für die Domains aus, die auf der Kommandozeile       #
#     angegeben wurden.                                                        #
#  b) Es können beliebig viele Domains angegeben werden.                       #
#  c) Das Ausgabeformat für jede Domain ist:                                   #
#     Domain:                                                                  #
#       Mailserver1.Domain                                                     #
#       Mailserver2.Domain                                                     #
#       ...                                                                    #
#  d) Wenn eine Domain nicht existiert, wird die folgende Ausgabe gemacht:     #
#     <Domain>:                                                                #
#     und sonst nichts (siehe Beispiel)                                        #
#                                                                              #
# Fehlerbehandlung                                                             #
#  e) Wenn nicht mindestens eine Domain angegeben wurde wird die Fehlermeldung #
#       usage: aufgabe-05.sh list-of-domains                                   #
#     ausgegeben und das Script mit dem Rückgabewert 1 beendet                 #
#                                                                              #
# Beispiele:                                                                   #
#   $ ./aufgabe-05.sh ifa.ch google.com fuzCfgKu.com                           #
#   ifa.ch:                                                                    #
#     ifa-ch.mail.protection.outlook.com.                                      #
#   google.com:                                                                #
#     alt3.aspmx.l.google.com.                                                 #
#     alt4.aspmx.l.google.com.                                                 #
#     aspmx.l.google.com.                                                      #
#     alt2.aspmx.l.google.com.                                                 #
#     alt1.aspmx.l.google.com.                                                 #
#   fuzCfgKu.com:                                                              #
#                                                                              #
# Hinweise:                                                                    #
#  1. Benennen sie diese Datei nicht um                                        #
#  2. Verwenden Sie Sie keine andere Shell als /bin/bash                       #
#  3. Gehen Sie davon aus, dass dieses Script root-Berechtigung ausgeführt     #
#    wird. Es ist also nicht nötig, vor Kommandos sudo anzugeben.              #
################################################################################
#               Geben Sie Ihre Lösung nach diesem Kommentar ein                #
################################################################################

if [ $# -lt 1 ]; then
    echo "usage: $(basename $0) list-of-domains"
    exit 1
fi

for domain in "${@}"; do
    echo ${domain}:
    dig -t MX ${domain} | grep ^${domain}. | awk '{ print "  " $6 }'
done
exit 0

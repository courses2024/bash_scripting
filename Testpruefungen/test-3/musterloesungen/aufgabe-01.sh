#!/bin/bash
################################################################################
#                       Modulprüfung LUIT Februar 2021                         #
#                               aufgabe-01.sh                                  #
#       Themen: Anzeige der Netzwerk-Einstellungen, Textausgaben filtern       #
################################################################################
# Schreiben Sie ein Script, das die unter Hauptfunktionen                      #
# genannten Anforderungen erfüllt:                                             #
#                                                                              #
# Hauptfunktionen                                                              #
#   Es werden untereinander folgende Informationen ausgegeben:                 #
#   a) Der voll qualifizierte Hostname (FQDN) des eigenen Servers              #
#   b) Der Name des 1. Netzwerk-Interface (nicht das Loopback-Interface)       #      
#   c) Die IPv4-Adresse des Interfaces                                         #
#   d) Die IPv4-Adresse des Default-Gateways                                   #
#   e) Die IPv6-Adresse des Interfaces                                         #
#   f) Die IPv6-Adresse des Default-Gateways                                   #
#   g) Die Ausgabe soll genau wie im Beispiel erfolgen                         #
#      (Bezeichnung, Whitepace(s) , Wert als Spalte linksbündig)               #
#                                                                              #
# Beispiel                                                                     #
#     $ ./aufgabe-01.sh                                                        #
#     Host                 zh24-student-11.eu-west6-a.c.admin-293.internal     #
#     Interface            ens4                                                #
#     IPv4                 10.172.0.2/32                                       #
#     DefaultGatewayIPv4   10.172.0.1                                          #
#     IPv6                 fe80::4001:aff:feac:2/64                            #
#     DefaultGatewayIPv6   fe80::/64                                           #
#     $                                                                        #
#                                                                              #
# Hinweise:                                                                    #
#  1. Benennen sie diese Datei nicht um                                        #
#  2. Verwenden Sie Sie keine andere Shell als /bin/bash                       #
#  3. Gehen Sie davon aus, dass dieses Script root-Berechtigung ausgeführt     #
#     wird. Es ist also nicht nötig, vor Kommandos sudo anzugeben.             #
################################################################################
#               Geben Sie Ihre Lösung nach diesem Kommentar ein                #
################################################################################
 echo "Host                 $(hostname -f)"
 iface=$(ip link show | grep ^2: | cut -d ' ' -f2 | tr -d :)
 echo "Interface            $iface" 
 echo "IPv4                 $(ip -o -4 address show dev $iface | awk '{print $4}')"
 echo "DefaultGatewayIPv4   $(ip -o -4 route show dev $iface | grep default | awk '{print $3}')"
 echo "IPv6                 $(ip -o -6 address show dev $iface | awk '{print $4}')"
 echo "DefaultGatewayIPv6   $(ip -o -6 route show dev $iface | awk '{print $1}')"

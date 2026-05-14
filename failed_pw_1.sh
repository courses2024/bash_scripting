#!/bin/bash
logfile=${logfile:=$1}
# ___________________________________________________________________________________________

# Zählen Sie die Anzahl Zeilen mit Eintrag, der "Failed Password" enthält
echo Total 'Failed password' messages in $logfile V1
grep -c "Failed password" $logfile
echo
# ___________________________________________________________________________________________

# Anzahl Zeilen mit Eintrag "Failed Password" V2
echo Total 'Failed password' messages in $logfile V2
grep "Failed password" $logfile | wc -l
echo
# ___________________________________________________________________________________________

# Zählen Sie die Zeilen mit "Failed Password" für jede Stunde V1
echo Total 'Failed password' messages per hour V1
grep "Failed password" $logfile |
 awk '{print substr($1,1,13)}' |
 sort |
 uniq -c
echo                  
# Schritt für Schritt: 
# 1. grep "Failed password" $logfile
#    Sucht nach "Failed password": in jeder Zeile von $logfile und gibt nur diese Zeilen aus
# 
# 2. awk '{print substr($1,1,13)}'
#    {print substr($1,1,13)}:
#       $1: Das erste Feld in der aktuellen Zeile.
#       substr($1, 1, 13): Dies extrahiert die ersten 13 Zeichen des ersten Feldes ($1).
#    Ergebnis: Das Kommando gibt die ersten 13 Zeichen des ersten Feldes jeder Zeile zurück.
# 
# 3. sort
#    Ergebnis: Das Kommando sortiert die extrahierten Zeilen alphabetisch.
# 
# 4. uniq -c
#       uniq: Befehl, der benachbarte Duplikate in einer Datei oder einer Zeichenkette entfernt.
#       -c: Diese Option zählt die Anzahl der Vorkommen jedes einzigartigen Eintrags.
#    Ergebnis: Das Kommando gibt die Anzahl der Vorkommen jedes einzigartigen Eintrags zurück.
# ___________________________________________________________________________________________

# Zählen Sie die Zeilen mit "Failed Password" für jede Stunde V2
echo Total 'Failed password' messages per hour V2
grep "Failed password" $logfile | 
 awk '{hour = substr($1,1,10) " " substr($1,12,2); print hour}' |  
 sort |
 uniq -c |                                                  
 awk '{print $2 " " $3 " bis " $3+1 " Uhr"}'          
 # awk '{print $logfile " " $2 " " $3 " bis " $3+1 " Uhr"}'          
echo
# Siehe vorherige Beschreibung V1. Schritte 1. - 4. Zusätzlich:
# 5. {print $logfile " " $2 " " $3 " bis " $3+1 " Uhr"}:
#       $2: Dies ist die Anzahl der Vorkommen eines einzigartigen Eintrags aus Schritt 4
#       $3: Dies ist der Datum und die Stunde (im Format "MM DD HH") aus Schritt 4
#       $3+1: Dies fügt 1 zur Stunde hinzu, um die Endzeit der Stunde zu berechnen.
# print $logfile " " $2 " " $3 " bis " $3+1 " Uhr": Dies gibt die Daten in das gewünschte Format aus.
# ___________________________________________________________________________________________

# Häufigste Quellen von Failed Login pro IP (Brute Force Versuch):
echo TOP 10 'Failed password' messages per IP Address
grep "Failed password" $logfile |
 awk '{print $(NF-3)}' |                           
 sort |                                            
 uniq -c |                                         
 sort -nr |                                        
 head -n 10                                        
echo

# Schritt für Schritt
# 1.	grep "Failed password" /var/log/auth.log
# 	Filtert nur die Zeilen, in denen ein fehlgeschlagener SSH-Login protokolliert ist.
# 	Typischer Eintrag:
# ... Failed password for invalid user user from 192.0.2.1 port 22 ssh2
# 2.	awk '{print $(NF-3)}'
# 	NF ist die Anzahl der Felder in der aktuellen Zeile.
# 	$(NF-3) bedeutet: nimm das drittletzte Feld.
# 	Bei einer typischen SSH-Fehlerzeile ist das drittletzte Feld die Quell-IP:
# 	... from 192.0.2.1 port 22 ssh2
# 	NF-3 → 192.0.2.1
# 3.	sort
# 	Sortiert die IP-Adressen alphabetisch, damit gleiche Adressen zusammenstehen.
# 4.	uniq -c
# 	Zählt, wie oft jede IP-Adresse vorkommt.
# 5.	sort -nr
# 	Sortiert die Ergebnisse numerisch absteigend nach Anzahl.
# 	Die IPs mit den meisten fehlgeschlagenen Login-Versuchen stehen oben.
# 6.	head -n 10
# 	Zeigt die Top 10 der auffälligsten IP-Adressen.
# ___________________________________________________________________________________________

# Häufigste Usernamen bei Failed Login (Brute Force Versuch):
echo TOP 10 'Failed password' messages per username
grep -oE "Failed password for [^ ]+ from" $logfile |  
 awk '{print $(NF-1)}' |                           
 sort |                                            
 uniq -c |                                         
 sort -nr |                                        
 head -n 10                        
echo                

# Schritt für Schritt:
# 1: Filtern der Log-Einträge
#    grep -oE "Failed password for [^ ]+ from" $logfile
#       -o: Gibt nur die übereinstimmenden Teile der Zeilen zurück, anstatt die ganze Zeile.
#       -E: Aktiviert Erweiterte Regex (Reguläre Ausdrücke), was das Schreiben komplexer Mustern einfacher macht.
#       Failed password for [^ ]+ from: Dieses Regex-Muster sucht nach dem Muster 
#       "Failed password for <username> from" in jeder Zeile.
#       [^ ]+: Ein oder mehrere Nicht-Leerraumzeichen, die den Benutzernamen repräsentieren.
# 
# 2: Extrahieren des Benutzernamens
#    awk '{print $(NF-1)}'
#       NF: Ein eingebaute Variable in awk, enthält die Anzahl der Felder (Spalten) in der aktuellen Zeile
#       $(NF-1): Bezieht sich auf das letzte Feld minus eins (Benutzername in diesem Kontext)
#.
# 3: Sortieren der Einträge
#    sort: Sortiert die Benutzername  alphabetisch
#
# 4: Zählen der Vorkommen jedes Benutzers
#    uniq -c
#       uniq: Entfernt doppelte Einträge und gibt die Anzahl jedes einzigartigen Eintrags zurück.
#       -c: Gibt einen Zähler jedes einzigartigen Eintrags aus.
# 
# 5: Sortieren der Zählungen in Absteigender Reihenfolge
#    sort -nr
#    sort: Sortiert die Eingabezeilen.
#    -n: Nummerische Sortierung anstelle alphabetischer Sortierung.
#    -r: Dreht die  die Sortierreihenfolge um (Höchste Zähler zuerst)
#
# 6: Ausgabe der Top 10 Benutzernamen
#    head -n 10
#       head: Gibt die ersten X Zeilen der Eingabe zurück.
#       -n 10: Die Top 10
# ___________________________________________________________________________________________

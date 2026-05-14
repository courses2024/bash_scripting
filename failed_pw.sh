# Zählen Sie die Anzahl Zeilen mit Eintrag, der "Failed Password" enthält
grep -c "Failed password" $logfile

# Anzahl Zeilen mit Eintrag "Failed Password" V2
grep "Failed password" $logfile | wc -l

# Zählen Sie die Zeilen mit "Failed Password" für jede Stunde V1
grep "Failed password" $logfile \
  | awk '{print substr($1,1,13)}' \                   # Extrahiere Jahr-Monat-Tag-Stunde (YYYY-MM-DD HH)
  | sort | uniq -c                                    # Zähle Vorkommen pro Stunde

# Zählen Sie die Zeilen mit "Failed Password" für jede Stunde V2
grep "Failed password" $logfile \
  | awk '{hour = substr($1,1,10) " " substr($1,12,2); print hour}' \  # Extrahiere Jahr-Monat-Tag und Stunde (YYYY-MM-DD HH)
  | sort | uniq -c \                                                  # Zähle Vorkommen pro Stunde
  | awk '{print $logfile " " $2 " " $3 " bis " $3+1 " Uhr"}'          # Formatiere Ausgabe. Stunde ist $3, Zeitraum ist $3 bis $3+1 Uhr

# Häufigste Quellen von Failed Login pro IP (Brute Force Versuch):
grep "Failed password" $logfile \
  | awk '{print $(NF-3)}' \                           # Extrahiere die IP-Adresse, die 3 Felder vor dem Ende der Zeile steht
  | sort \                                            # Sortiere die IP-Adressen
  | uniq -c \                                         # Zähle Vorkommen pro IP-Adresse
  | sort -nr \                                        # Sortiere nach Anzahl Vorkommen in absteigender Reihenfolge
  | head -n 10                                        # Zeige die Top 10 IP-Adressen mit den meisten Failed Login Versuchen

# Häufigste Usernamen bei Failed Login (Brute Force Versuch):
grep -oE "Failed password for [^ ]+ from" $logfile \  # Extrahiere den Teil "Failed password for USERNAME from"
  | awk '{print $(NF-1)}' \                           # Extrahiere den USERNAME, der 1 Feld vor "from" steht
  | sort \                                            # Sortiere die Usernamen
  | uniq -c \                                         # Zähle Vorkommen pro Benutzername
  | sort -nr \                                        # Sortiere nach Anzahl Vorkommen in absteigender Reihenfolge 
  | head -n 10                                        # Zeige die Top 10 Usernamen mit den meisten Failed Login Versuchen


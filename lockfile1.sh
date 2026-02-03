#!/bin/bash

# lockfile1.sh, 1. Version
# Das Script sollte parallel in mehreren Fenstern jeweils in einer Schleife
# gestartet werden:
# while true; do ./locktest.sh; sleep 5; done
# (Abbruch mit CTRL-C)

lockfile=/var/tmp/mylock

echo Process $$ started
# 2. Falls die Datei nicht exitiert, schreibt das Script seine PID in $lockfile
if ! [ -e "$lockfile" ] 2> /dev/null; then
    # Datei existierte nicht → Lock anlegen
    echo "$$" > "$lockfile"
    # Bei Ctrl+C, kill oder normalem Beenden
    # sicherstellen, dass das Lockfile nicht hängenbleibt
    trap 'rm -f "$lockfile"; exit $?' INT TERM EXIT

    # Der kritische Bereich: Hier würde die eigentliche Arbeit des Scripts kommen
    echo Process $$ acquired lock
    sleep 5

    # Aufräumen und Trap aufheben
    rm -f "$lockfile"
    trap - INT TERM EXIT
else
    # Datei existierte → Ein anderer Prozess hat den Lock
    echo "Lock Exists: $lockfile owned by $(cat $lockfile)"
fi

# ACHTUNG: In dieser Version gibt es ein potentielles Problem:
# Zwischen der Zeile 13 ( if ! [ -e "$lockfile" ] ) und der
# Zeile 15 vergeht eine minimale Zeitspanne.
# In dieser Zeitspanne könnte eine andere Instanz des Scripts
# das Lock für sich reklamiert haben!
#
# Eine Variante, die dieses Problem vermeidet, finden Sie in lockfile2.sh

#!/bin/bash

# lockfile2.sh verbessert lockfile1.sh
# Auch diese Version sollte parallel in mehreren Fenstern jeweils in einer Schleife
# gestartet werden:
# while true; do ./locktest.sh; sleep 5; done
# (Abbruch mit CTRL-C)

lockfile=/var/tmp/mylock

echo Process $$ started
# Der Code hinter if läuft in einer Subshell ( ... )
# 1. set -o noclobber verhindert darin das Überschreiben bestehender Dateien
# 2. Falls die Datei nicht exitiert, schreibt das Script seine PID in $lockfile
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null; then
    # Datei existierte nicht → Lock erfolgreich erhalten
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

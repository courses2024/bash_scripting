#!/bin/bash
LOCKDIR=/tmp/locktest
LOCKFILE="$LOCKDIR/lock"
COMMON="$LOCKDIR/common"

mkdir -p "$LOCKDIR"
touch "$LOCKFILE"
chmod 0666 "$LOCKFILE"

cleanup() {
  if [ -f "$LOCKFILE" ]; then
    cur=$(cat "$LOCKFILE" 2>/dev/null || true)
    if [ "$cur" = "$$" ]; then
      : > "$LOCKFILE"
      chmod 0666 "$LOCKFILE"
    fi
  fi
  exit 0
}

trap cleanup SIGINT SIGTERM

while true; do
  # sicherstellen, dass Datei existiert
  if [ ! -e "$LOCKFILE" ]; then
    mkdir -p "$LOCKDIR"
    touch "$LOCKFILE"
    chmod 0666 "$LOCKFILE"
  fi

  # atomare Sperre via flock auf Dateideskriptor 9
  exec 9>"$LOCKFILE"
  if flock -n 9; then
    # exklusiv: eigene PID in lockfile eintragen und Datei readonly setzen
    echo "$$" > "$LOCKFILE"
    chmod 0444 "$LOCKFILE"

    # Nachricht in common schreiben
    echo "$$" "$(date +'%F %T')" >> "$COMMON"

    sleep 2

    # wieder beschreibbar machen und Lock freigeben
    chmod 0666 "$LOCKFILE"
    flock -u 9
  else
    pid=$(cat "$LOCKFILE" 2>/dev/null || echo "unbekannt")
    >&2 printf 'Datei gesperrt durch %s\n' "$pid"
    sleep 1
  fi
  exec 9>&-
done
# ...existing code...
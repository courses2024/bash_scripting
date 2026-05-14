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
    : > "$LOCKFILE"
    chmod 0666 "$LOCKFILE"
  fi

  if [ -w "$LOCKFILE" ]; then
    # eigenen PID eintragen und Datei readonly setzen
    printf '%s\n' "$$" > "$LOCKFILE"
    chmod 0444 "$LOCKFILE"

    # Nachricht in common schreiben
    printf '%s: %s\n' "$$" "$(date +'%F %T')" >> "$COMMON"

    sleep 2

    # wieder beschreibbar machen
    chmod 0666 "$LOCKFILE"
  else
    pid=$(cat "$LOCKFILE" 2>/dev/null || echo "unbekannt")
    >&2 printf 'Datei gesperrt durch %s\n' "$pid"
    sleep 1
  fi
done
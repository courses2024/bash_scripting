#!/bin/bash

count=0
buffer=()

while IFS= read -r line; do
  # Prüfe mit awk ob id < 20
  if echo "$line" | awk '$15 < 20 {exit 0} {exit 1}'; then
    ((count++))
    buffer+=("$line")
  else
    # id >= 20, Sequenz ist zu Ende
    if (( count > 60 )); then
      printf '%s\n' "${buffer[@]}"
    fi
    count=0
    buffer=()
  fi
done < vmstat.log

# Am Ende: Falls noch Puffer mit > 60 Sekunden
if (( count > 60 )); then
  printf '%s\n' "${buffer[@]}"
fi

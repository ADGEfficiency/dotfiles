#!/usr/bin/env bash

today=$(date +%Y-%m-%d)
tomorrow=$(gdate -d "tomorrow" '+%Y-%m-%d')
yesterday=$(gdate -d "yesterday" '+%Y-%m-%d')
file="$HOME/personal/para/day/$today.md"

new_note() {
  touch "$file"

  # Format the file with the daily template
  cat <<EOF >"$file"
---
id: $today
tags:
- daily-notes
---

# Yesterday & Tomorrow

[[$yesterday]] - [[$tomorrow]]

## Today

EOF
}

# If the daily note does not exist, create a new one.
# this uses the test command with the -f flag.
if [ ! -f "$file" ]; then
  new_note
fi

nvim "$file"

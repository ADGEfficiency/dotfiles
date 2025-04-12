#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
  echo "No arguments provided. Usage: $0 note-name"
  exit 1
fi

# Define base note directory
NOTE_DIR="$HOME/personal/resource/atomic"

# Construct the filename
FILENAME="${NOTE_DIR}/$1.md"

"$EDITOR" "$FILENAME"

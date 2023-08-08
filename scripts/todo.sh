#!/bin/bash

# tests the script in ~/dotfiles/scripts/todo.sh

function open_todo_file() {
  TODO_FILE_NAME=$1
  #  override TODO_DIR during tests
  TODO_DIR="${TODO_DIR:-$HOME/personal/todo}"
  DEFAULT_FILE="$TODO_DIR/todo.md"

  if [[ -f $TODO_FILE_NAME ]]; then
    TODOFILE=$(cat $TODO_FILE_NAME)
    FILE_TO_OPEN="$TODO_DIR/$TODOFILE.md"
  else
    FILE_TO_OPEN="$TODO_DIR/$(basename "$PWD").md"
  fi

  # Check if the file exists, if not, use the default
  if [[ ! -f $FILE_TO_OPEN ]]; then
    FILE_TO_OPEN=$DEFAULT_FILE
  fi

  echo "$FILE_TO_OPEN"  # echo the result for testing purposes
}

# Uncomment below to run the function directly
## If this script is being executed, and not sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  FILE_TO_OPEN=$(open_todo_file "$PWD/.todofile")
  $EDITOR $FILE_TO_OPEN
fi

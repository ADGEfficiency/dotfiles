#!/bin/bash

function open_todo_file() {

  #  override TODO_DIR during tests
  TODO_DIR="${TODO_DIR:-$HOME/personal/para/project}"

  #  if we pass a CLI arg, then go there
  if [ "$1" ]; then
    TODOFILE=$1

    #  otherwise try to find a .todofile
  elif [ -f "$PWD/.todofile" ]; then
    TODOFILE=$(cat "$PWD/.todofile")

    #  finally use the current directory name
  else
    TODOFILE=$(basename "$PWD")
  fi

  FILE_TO_OPEN="$TODO_DIR/$TODOFILE.md"

  #  check if the file exists, if not, use the default
  DEFAULT_FILE="$TODO_DIR/../todo.md"

  if [[ ! -f $FILE_TO_OPEN ]]; then
    FILE_TO_OPEN=$DEFAULT_FILE
  fi
  echo "$FILE_TO_OPEN"
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  if [ "$1" ]; then
    FILE_TO_OPEN=$(open_todo_file "$1")
  else
    FILE_TO_OPEN=$(open_todo_file)
  fi
  "$EDITOR" "$FILE_TO_OPEN"
fi

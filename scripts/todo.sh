#!/bin/bash

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then

  #  override TODO_DIR during tests
  TODO_DIR="${TODO_DIR:-$HOME/personal/todo}"

  #  if we pass a CLI arg, then go there
  if [ "$1" ]; then
    TODOFILE=$1
  #  otherwise try to find a .todofile
  elif [ -f "$PWD/.todofile" ]; then
    TODOFILE=$(cat $TODO_FILE_NAME)
  #  finally use the current directory name
  else
    TODOFILE=$(basename "$PWD")
  fi

  FILE_TO_OPEN="$TODO_DIR/$TODOFILE.md"

  # Check if the file exists, if not, use the default
  DEFAULT_FILE="$TODO_DIR/todo.md"

  if [[ ! -f $FILE_TO_OPEN ]]; then
    FILE_TO_OPEN=$DEFAULT_FILE
  fi

  $EDITOR $FILE_TO_OPEN
fi

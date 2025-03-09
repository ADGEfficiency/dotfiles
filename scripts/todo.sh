#!/bin/bash

function open_todo_file() {


  # override TODO_DIR during tests
  TODO_DIR="${TODO_DIR:-$HOME/personal/para/project}"

  # if we pass a CLI arg, then go there
  if [ "$1" ]; then
    TODOFILE=$1

    # otherwise try to find a .todofile
  elif [ -f "$PWD/.todofile" ]; then
    TODOFILE=$(cat "$PWD/.todofile")

    # finally use the current directory name
  else
    TODOFILE=$(basename "$PWD")
  fi

  FILES_TO_OPEN=(
    "$TODO_DIR/$TODOFILE.md"
    "$TODO_DIR/$TODOFILE/$TODOFILE.md"
    "$TODO_DIR/$TODOFILE/todo.md"
    "$TODO_DIR/todo.md"
  )

  # the default file
  FILE_TO_OPEN="$TODO_DIR/../todo.md"
  for CANDIDATE in "${FILES_TO_OPEN[@]}"; do
    if [[ -f $CANDIDATE ]]; then
      FILE_TO_OPEN=$CANDIDATE
      break
    fi
  done
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

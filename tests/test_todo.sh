#!/bin/bash

# opens the most relevant todo.md file
# this allows access to project specific notes in project dirs
# or a default general todo elsewhere

# if .todofile exists, open file from .todofile
# else check for a file in ~/personal/todo/(current dir).md
# else open ~/personal/todo/todo.md

. ./scripts/todo.sh

testOpenTodoFileWithTodoFile() {
  echo "Current directory in CI: $(pwd)"
  echo "HOME variable: $HOME"
  echo "data-science-south" > .todofile
  echo ".todofile content: $(cat .todofile)"  # Verify the content
  todofile="$PWD/.todofile"
  echo ".todofile content: $todofile"  # Verify the content
  result=$(open_todo_file $todofile)
  echo "Result: $result" # Print the result
  # expect a project specific file
  assertEquals "$HOME/personal/todo/data-science-south.md" "$result"
  rm .todofile
}

testOpenTodoFileWithExistingFile() {
  export TODO_DIR=$(mktemp -d)
  touch "$TODO_DIR/$(basename "$PWD").md"
  result=$(open_todo_file)
  # expect a project specific file
  assertEquals "$TODO_DIR/$(basename "$PWD").md" "$result"
  rm -r "$TODO_DIR"
}

testOpenTodoFileWithNonExistingFile() {
  export TODO_DIR=$(mktemp -d)
  result=$(open_todo_file)
  # expect the default file
  assertEquals "$TODO_DIR/todo.md" "$result"
  rm -r "$TODO_DIR"
}

. shunit2

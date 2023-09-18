#!/usr/bin/env zsh

_todo() {
  local -a matches
  matches=($(ls $HOME/personal/todo | sed 's/.md//'))

  _describe 'todo file' matches
}

compdef _todo todo

#!/usr/bin/env bash

# vim master race
set -o vi

# don't add duplicates
export HISTCONTROL=ignoreboth:erasedups

# remember a lot
export HISTFILE=~/.bash_history
export HISTFILESIZE=10000000
export HISTSIZE=$HISTFILESIZE
export SAVEHIST=$HISTSIZE

# after each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# aws
export AWS_LOG_LEVEL=3

# load my functions and aliases
source "$HOME/dotfiles/scripts/funcs.sh"
source "$HOME/dotfiles/scripts/aliases.sh"
source "$HOME/dotfiles/dotfiles/common/setup-path.sh"

starship_init() {
  export STARSHIP_CONFIG=~/dotfiles/starship/starship.toml
  eval "$(starship init bash)"
}

fzf_init() {
  export FZF_BASE=/usr/local/bin/fzf
  source "$HOME"/dotfiles/fzf/.fzf.bash
  export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --line-buffered --ignore-file ~/.gitignore'
  export FZF_DEFAULT_OPTS='--height 40% --preview "bat -p {}" --preview-window=down:50%:wrap --border=none'
  export FZF_CTRL_R_OPTS='--height 20% --no-preview'
}

starship_init
fzf_init

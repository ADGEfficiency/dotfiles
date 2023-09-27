#  turn on when profiling
# zmodload zsh/zprof

# # ------ 3rd party -------

fzf_init() {
    export FZF_BASE=/usr/local/bin/fzf
    bindkey -v
    source ~/dotfiles/dotfiles/.fzf.zsh
    export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --line-buffered --ignore-file ~/.gitignore'
    export FZF_DEFAULT_OPTS='--height 40% --preview "bat -p {}" --preview-window=down:50%:wrap --border=none'
    export FZF_CTRL_R_OPTS='--height 20% --no-preview'
}

nvm_init() {
  export NVM_DIR="$HOME/dotfiles/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

ruby_init() {
    eval "$(rbenv init -)"
    rbenv shell 2.7.2
    export RBENV_ROOT=/usr/local/var/rbenv
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    export PATH="$HOME/.rbenv/shims:$PATH"
}

pretzo_init() {
  #  this is here for a reason ^^
  export STARSHIP_CONFIG=~/dotfiles/starship/starship.toml
  source $HOME/dotfiles/zsh/.zprezto/init.zsh
  source $HOME/dotfiles/dotfiles/.zpreztorc
}

starship_init() {
  export STARSHIP_CONFIG=~/dotfiles/starship/starship.toml
  eval "$(starship init zsh)"
}

flyctl_init() {
  export FLYCTL_INSTALL="$HOME/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"
}

atuin_init() {
  eval "$(atuin init zsh --disable-up-arrow)"
}

just_completions_init() {
  # Path to just.zsh
  JUST_COMPLETIONS_PATH="$HOME/dotfiles/just.zsh"

  # Check if just.zsh exists
  if [ -f "$JUST_COMPLETIONS_PATH" ]; then
    autoload -U compinit
    compinit
  else
    just --completions zsh > "$JUST_COMPLETIONS_PATH"
  fi
}

starship_init
pretzo_init
fzf_init
flyctl_init
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
just_completions_init

#  docker desktop
# source /Users/adam/.docker/init-zsh.sh || true


export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000000
export HISTSIZE=$HISTFILESIZE
SAVEHIST=$HISTSIZE
export AWS_LOG_LEVEL=3

alias brew='arch -x86_64 brew'
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/checkmake:$PATH"
export PATH="$HOME/dotfiles/scripts:$PATH"
export PATH="$HOME/personal/scripts:$PATH"


source ~/dotfiles/macos/pyenv-flags
source $HOME/dotfiles/scripts/funcs.sh
source $HOME/dotfiles/scripts/aliases.sh

# Zsh completion for todo
# TODO move this at some point
source $HOME/dotfiles/scripts/todo-completion.zsh

# need a fancy npm setup when npm manages nix
# requires a .npmrc with a prefix
export PATH=~/.npm-packages/bin:$PATH
export NODE_PATH=~/.npm-packages/lib/node_modules
export PATH="/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:$PATH"

#  turn on when profiling
# zprof
#

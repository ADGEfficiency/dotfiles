bash $HOME/dotfiles/scripts/trace.sh "$0"

export DISABLE_PYENV=1

pyenv_init() {
  if [ -z "$DISABLE_PYENV" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
}

fzf_init() {
    export FZF_BASE=/usr/local/bin/fzf
    bindkey -v
    source $HOME/.fzf.zsh
    export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --line-buffered --ignore-file ~/.gitignore'
    export FZF_DEFAULT_OPTS='--height 40% --preview "bat -p {}" --preview-window=down:50%:wrap --border=none'
    export FZF_CTRL_R_OPTS='--height 20% --no-preview'
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
  source $HOME/dotfiles/zsh/.zprezto
  source $HOME/dotfiles/dotfiles/common/.zpreztorc
  source ~/.zprezto/init.zsh
}

starship_init() {
  export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
  eval "$(starship init zsh)"
}

flyctl_init() {
  export FLYCTL_INSTALL="$HOME/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"
}

atuin_init() {
  eval "$(atuin init zsh --disable-up-arrow)"
}

fpath=($HOME/dotfiles/zsh/custom-autocomplete/ $fpath)
autoload -U compinit
compinit
autoload -Uz $HOME/dotfiles/zsh/custom-autocomplete/todo

export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000000
export HISTSIZE=$HISTFILESIZE
SAVEHIST=$HISTSIZE
export AWS_LOG_LEVEL=3

alias brew='arch -arm64 brew'
source ~/dotfiles/macos/pyenv-flags

# custom ipython config
export IPYTHONDIR="$HOME/dotfiles/config/.ipython"

# need a fancy npm setup when npm manages nix - requires a .npmrc with a prefix
export PATH=~/.npm-packages/bin:$PATH
export NODE_PATH=~/.npm-packages/lib/node_modules
export PATH="/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:$PATH"

pyenv_init
starship_init
flyctl_init

eval "$(zoxide init zsh)"
eval "$(ssh-agent)"  &>/dev/null &>/dev/null
eval "$(direnv hook zsh)"

# done twice for a reason
pretzo_init
fzf_init
source "$HOME/dotfiles/dotfiles/common/env.sh"
source "$HOME/dotfiles/dotfiles/common/setup-path.sh"

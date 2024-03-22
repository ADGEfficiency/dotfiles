source $HOME/dotfiles/zsh/.zprezto/init.zsh
source $HOME/dotfiles/dotfiles/common/.zpreztorc

pyenv_init() {
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}

fzf_init() {
    export FZF_BASE=/usr/local/bin/fzf
    bindkey -v
    source ~/dotfiles/fzf/.fzf.zsh
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
  export STARSHIP_CONFIG=~/dotfiles/starship/starship.toml
  source $HOME/dotfiles/zsh/.zprezto/init.zsh
  source $HOME/dotfiles/dotfiles/common/.zpreztorc
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

fpath=($HOME/dotfiles/zsh/custom-autocomplete/ $fpath)
autoload -U compinit
compinit
autoload -Uz $HOME/dotfiles/zsh/custom-autocomplete/todo

export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000000
export HISTSIZE=$HISTFILESIZE
SAVEHIST=$HISTSIZE
export AWS_LOG_LEVEL=3

alias brew='arch -x86_64 brew'
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/checkmake:$PATH"
export PATH="$HOME/dotfiles/scripts:$PATH"
export PATH="$HOME/personal/para/area/script:$PATH"

source ~/dotfiles/macos/pyenv-flags
source $HOME/dotfiles/scripts/funcs.sh
source $HOME/dotfiles/scripts/aliases.sh

# custom ipython config
export IPYTHONDIR="/Users/adam/dotfiles/.ipython"

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

pretzo_init
pretzo_init
fzf_init

# set -x

#  turn on when profiling
# zmodload zsh/zprof

# # ------  general  -------

#  use neovim as editor
export EDITOR=$(which nvim)

#  put config in ~/dotfiles (instead of ~/.config)
export XDG_CONFIG_HOME=~/dotfiles
launchctl setenv XDG_CONFIG_HOME $XDG_CONFIG_HOME

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# # ------  utility  -------

alias brew='arch -x86_64 brew'
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/checkmake:$PATH"
export PATH="$HOME/dotfiles/scripts:$PATH"
export PATH="$HOME/personal/scripts:$PATH"

# # ------ 3rd party -------

fzf_init() {
    export FZF_BASE=/usr/local/bin/fzf
    export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --line-buffered --ignore-file ~/.gitignore'
    # export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --glob=!__.pycache__ --glob=!_.mypy_cache --glob=!.git/* -l --smart-case --line-buffered --pretty'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --multi'
    bindkey -v
    source ~/.fzf.zsh
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
  export STARSHIP_CONFIG=~/dotfiles/starship.toml
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
}

starship_init() {
  eval "$(starship init zsh)"
}

flyctl_init() {
  export FLYCTL_INSTALL="$HOME/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"
}

atuin_init() {
  eval "$(atuin init zsh --disable-up-arrow)"
}

# # ------ 3rd party inits -------

pretzo_init
starship_init
fzf_init
flyctl_init
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

source ~/dotfiles/macos/pyenv-flags

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

source /Users/adam/.config/broot/launcher/bash/br
#
#  docker desktop
source /Users/adam/.docker/init-zsh.sh || true

#  turn on when profiling
# zprof

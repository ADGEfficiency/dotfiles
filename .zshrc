# set -x

# zmodload zsh/zprof

# # ------  general  -------

#  use neovim as editor
export EDITOR=$(which nvim)
#  put config in ~/dotfiles (instead of ~/.config)
export XDG_CONFIG_HOME=~/dotfiles

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE


# # ------  utility  -------

alias brew='arch -x86_64 brew'
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/checkmake/:$PATH"
export PATH="$HOME/dotfiles/scripts/:$PATH"


# # --- powerlevel10k

init_powerlevel() {
  source ~/powerlevel10k/powerlevel10k.zsh-theme

  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
}

# # ------ 3rd party -------

init_fzf() {
    export FZF_BASE=/usr/local/bin/fzf
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --multi'
    bindkey -v
    source ~/.fzf.zsh
}


init_nvm() {
  export NVM_DIR="$HOME/dotfiles/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

init_ruby() {
    eval "$(rbenv init -)"
    rbenv shell 2.7.2
    export RBENV_ROOT=/usr/local/var/rbenv
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    export PATH="$HOME/.rbenv/shims:$PATH"
}

init_pretzo() {
  export STARSHIP_CONFIG=~/dotfiles/starship.toml
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
}

init_starship() {
  eval "$(starship init zsh)"
}

init_flyctl() {
  export FLYCTL_INSTALL="$HOME/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"
}

# # ------ 3rd party inits -------
init_pretzo
init_starship
init_fzf
init_flyctl
# init_nvm
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# set +x

source ~/dotfiles/macos/pyenv-flags


# zprof

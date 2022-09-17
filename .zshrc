# set -x

zmodload zsh/zprof


# # ------  general  -------

#  use neovim as editor
export EDITOR=$(which nvim)
#  put config in ~/dotfiles (instead of ~/.config)
export XDG_CONFIG_HOME=~/dotfiles


# # ------  utility  -------

timezsh() {
    shell=${1-$SHELL}
    for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
alias brew='arch -x86_64 brew'
export PATH="$HOME/.poetry/bin:$PATH"


# # --- powerlevel10k

init_powerlevel() {
  source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
}


# # ------ oh-my-zsh -------

export ZSH="/Users/adam/.oh-my-zsh"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ENABLE_CORRECTION="false"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git macos pyenv zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# # ------ 3rd party -------

init_fzf() {
    export FZF_BASE=/usr/local/bin/fzf
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --multi'
    bindkey -v
    source ~/.fzf.zsh
}

init_pyenv() {
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init --path)"
    fi
}

init_nvm() {
  export NVM_DIR="$HOME/dotfiles/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# # ------ 3rd party inits -------
init_fzf
init_powerlevel
eval "$(zoxide init zsh)"

# set +x

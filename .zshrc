source /Users/adam/.config/broot/launcher/bash/br
export PATH="$HOME/.poetry/bin:$PATH"
alias brew='arch -x86_64 brew'

# # --- powerlevel10k

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# # ------ vim -------

#  vim bindings, vim as default editor
set -o vi
export EDITOR=/usr/local/bin/vi
export VISUAL=/usr/local/bin/vi

#  make the vim undo dir - not made automatically by vim...
mkdir -p ~/.vim/undodir


# # ------ zsh -------

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE


# # ------ oh-my-zsh -------
export ZSH="/Users/adam/.oh-my-zsh"

# suggestions
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# auto-correction
ENABLE_CORRECTION="false"

# disable marking untracked files under VCS as dirty - makes repository status check for large repositories faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git macos python fzf pyenv zsh-autosuggestions)

#  brew install romkatv/powerlevel10k/powerlevel10k
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

source $ZSH/oh-my-zsh.sh

# # ------ 3rd party -------

# ruby
init_ruby() {
  eval "$(rbenv init -)"
  rbenv shell 2.7.2
  export RBENV_ROOT=/usr/local/var/rbenv
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
  export PATH="$HOME/.rbenv/shims:$PATH"
}

# pyenv
init_pyenv() {
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
  fi
}

# conda
init_conda() {
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/opt/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/opt/anaconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}

# aws
init_aws() {
  source ~/dotfiles/aws/ec2.sh
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
  export AWS_LOG_LEVEL=3
}

# fzf
init_fzf() {
  export FZF_BASE=/usr/local/bin/fzf
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --multi'
  bindkey -v
  source ~/.fzf.zsh
}

# # ------ 3rd party inits -------
init_fzf

eval "$(zoxide init zsh)"

#  multiple node versions
export NVM_DIR="$HOME/dotfiles/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# # ------ complilation flags -------
source $HOME/dotfiles/macos/flags

source $HOME/dotfiles/aliases.sh
source $HOME/dotfiles/funcs.sh
alias cd='z'

source ~/personal/extract-code-from-md/extract
source ~/personal/scripts/random_name
export EDITOR=$(which nvim)
export XDG_CONFIG_HOME=~/dotfiles
export PATH="$HOME/checkmake:$PATH"
export PATH="$HOME/writing-tools:$PATH"

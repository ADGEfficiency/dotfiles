#  used by dotfiles/.aliases
export HME=$HOME
HISTSIZE=100000

#  vim bindings, vim as default editor
set -o vi
export EDITOR=/usr/local/bin/vi
export VISUAL=/usr/local/bin/vi

#  make the vim undo dir - not made automatically by vim...
mkdir -p ~/.vim/undodir


# # ------ zsh -------


# # ------ oh-my-zsh -------
export ZSH="/Users/adam/.oh-my-zsh"

# suggestions
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# auto-correction
ENABLE_CORRECTION="false"

# disable marking untracked files under VCS as dirty - makes repository status check for large repositories faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git osx python fzf pyenv zsh-autosuggestions)

ZSH_THEME="powerlevel10k/powerlevel10k"
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
  __conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
          . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
      else
          export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # disable automatic init of base
  conda deactivate
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
# init_pyenv
init_fzf

eval "$(zoxide init zsh)"


# # ------ complilation flags -------
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib -L/usr/local/opt/tcl-tk/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip3/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/readline/include -I/usr/local/opt/zlib/include -I/usr/local/opt/tcl-tk/include"

export PATH=$PATH:/usr/local/opt/tcl-tk/bin
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"

source $HME/dotfiles/.aliases
source $HME/dotfiles/.funcs
alias cd='z'


# # gridcog
export emd_bucket="gridcognition-modelling-services-dev-account"
export emd_prefix="external_market_data_test"

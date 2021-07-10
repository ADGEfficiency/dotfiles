#  used by dotfiles/.aliases
export HME=$HOME
HISTSIZE=100000

#  vim bindings, vim as default editor
set -o vi
export EDITOR=/usr/local/bin/vi
export VISUAL=/usr/local/bin/vi


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
  eval "$(pyenv init - --no-rehash)"
  eval "$(pyenv virtualenv-init -)"
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

# change github remote - useful when changing to ssh
remote() {
  git remote set-url origin $1
}


# # ------ 3rd party inits -------
init_pyenv
init_fzf

eval "$(zoxide init zsh)"


# # ------ complilation flags -------
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib -L/usr/local/opt/tcl-tk/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip3/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/readline/include -I/usr/local/opt/zlib/include -I/usr/local/opt/tcl-tk/include"

export PATH=$PATH:/usr/local/opt/tcl-tk/bin
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"


# # ------ custom -------

make_env() {
  pyenv virtualenv $1 $2
	echo $2 > .python-version
	source activate $2
	pip install --upgrade pip
	pip install -r requirements.txt
}

delete_env() {
  pyenv virtualenv-delete $1
}

json() {
  cat $1 | jq | less
}

csv() {
  cat $1 | column -t -s,
}

parquet() {
  python -c "import pandas as pd; df = pd.read_parquet('${1}'); print(df.columns); print(df.iloc[:3, :7])"
}

parqueti() {
  python -ic "import pandas as pd; df = pd.read_parquet('${1}'); print(df.columns); print(df.iloc[:3, :7])"
}

tunnel() {
  port=$1
  userhost=$2
  ssh -i ~/.ssh/adam-aws-may-2020.pem -N -L "localhost:${port}:localhost:${port}" $userhost
}

#  some stuff needs to be done before powerlevel10k
quote () {
  QUOTES="$HOME/personal/lists/quotes_snippets.md"
  NUM_LINES=$(wc -l $QUOTES | awk '{print $1}')
  LINE=$((1 + RANDOM % $NUM_LINES))
  echo $(sed -n ${LINE}p ${QUOTES})
 }

# quote
# echo ""
# quote

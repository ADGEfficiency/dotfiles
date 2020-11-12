#zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH='/Volumes/Julia-1.2.0/Julia-1.2.app/Contents/Resources/julia/bin':$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/adam/.oh-my-zsh"

# pytube
export PATH=$HOME/git/pytube:$PATH

HISTSIZE=100000

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#
#ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$' '
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$' '
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR_BACKGROUND='red'

POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''

POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='red'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='none'

POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='green'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='none'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='none'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_SEPARATOR=''

POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_BACKGROUND='none'

POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='none'

POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='green'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'

POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='none'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='none'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='none'

POWERLEVEL9K_PYENV_FOREGROUND='white'
POWERLEVEL9K_PYENV_BACKGROUND='none'
POWERLEVEL9K_PYTHON_ICON='\UE73C'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(pyenv vi_mode vcs dir newline)
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=true

POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON=''

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
export FZF_BASE=/usr/local/bin/fzf
plugins=(git osx python fzf pyenv zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

source /Users/adam/git/dotfiles/.aliases

bindkey -v
source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --multi'

source ~/git/org/org
source ~/git/mono/adg-aws/ec2.sh

quote () {
    QUOTES="$HOME/git/personal/lists/quotes_snippets.md"
    NUM_LINES=$(wc -l $QUOTES | awk '{print $1}')
    LINE=$((1 + RANDOM % $NUM_LINES))
    echo $(sed -n ${LINE}p ${QUOTES})
}

#echo
quote
# echo
# quote
# echo

#  world models config
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export AWS_REGION="eu-central-1"
export AWS_LOG_LEVEL=3

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Set username to consider a default context, which by default will not be shown.
# https://github.com/bhilburn/powerlevel9k/blob/next/segments/context/README.md
# export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/adam/.gem/ruby/2.6.0/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0:$PATH"

# autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="012"
POWERLEVEL9K_DIR_FOREGROUND='010'
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="012"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="012"

POWERLEVEL9K_DIR_ETC_BACKGROUND="clear"
POWERLEVEL9K_ETC_ICON='%F{blue}\uf423'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"

POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%F{008}\uf460%F{008}'

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

# https://stackoverflow.com/questions/22550068/python-not-configured-for-tk/31299142
# tkinter 
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PATH=$PATH:/usr/local/opt/tcl-tk/bin

tmuxvideo() {
	tmux -f /Users/adam/git/dotfiles/.tmux.conf.video new 
}
zshrcvideo() {
	source ~/git/dotfiles/.zshrc.video
}
vimvideo() {
	vim -u /Users/adam/git/dotfiles/.vimrc.video
}


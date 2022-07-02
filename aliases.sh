#!/usr/bin/env bash

export todo=$HOME/personal/todo.md
export vimrc=$HOME/dotfiles/.vimrc
export CHEAT=$HOME/personal/lists/cheat_sheet.md
export PER=$HOME/personal/
export GDR=$HOME/GoogleDrive

alias s='$EDITOR $(fzf)'
alias v='$EDITOR serverless.yml Makefile README.md'
alias vi='$EDITOR'

alias cp='cp -r '

# programs
alias g='grep -irl '
alias b='cd ..'
alias c='clear'
alias cls='clear && ls'
alias cll='clear && ll'
alias ctree='clear && tree'
# alias ls='ls -aGFlopnk'
alias ls='exa --long --icons --no-permissions --no-user --git --time-style long-iso --time=modified --group-directories-first -a'
alias ll='exa -G --icons --group-directories-first -a'
alias ipy='ipython'
alias pip='pip3'
alias req='pip install -r requirements.txt'
alias jl='jupyter lab > /dev/null 2>&1 &'
alias py='python'
alias pyt='pytest'
alias rm='rm -rf'
alias mkdir='mkdir -p'
alias df='df -h'
alias tree="tree -I '*pycache*'"

# be polite!
alias please='sudo'

# files
alias todo='$EDITOR $HOME/personal/todo.md'
alias td='todo'
alias ideas='$EDITOR $HOME/climate-code/notes/content/ideas/readme.md'

alias back='cd -'

# folders
alias cdb='cd $HOME/climate-news-db'
alias blog='cd $HOME/adgefficiency.github.io/'
alias web='cd $HOME/climate-code/website'
alias content='cd $HOME/climate-code/notes/content'
alias website='cd $HOME/climate-code/website'
alias ep='cd $HOME/energy-py-experiments/energy-py'
alias epl='cd $HOME/energy-py-experiments/energy-py-linear'
alias expt='cd $HOME/energy-py-experiments'
alias per='cd $HOME/personal'
alias prog='cd $HOME/programming-resources'
alias teach='cd $HOME/teaching-monolith'
alias syl='cd $HOME/handbook'

alias je='bundle exec jekyll serve > /dev/null 2>&1 &'
alias jed='init_ruby; bundle exec jekyll serve --drafts > /dev/null 2>&1 &'

# spelling
alias exut='exit'
alias eixt='exit'
alias exot='exit'
alias ext='exit'
alias eit='exit'
alias q='exit'
alias wi='vi'

# dotfiles
alias dots='cd $HOME/dotfiles'
alias aliases='$EDITOR $HOME/dotfiles/aliases.sh'
alias bashrc='$EDITOR $HOME/dotfiles/.bashrc'
alias bashprofile='$EDITOR $HOME/dotfiles/.bash_profile'
alias vrc='$EDITOR $HOME/dotfiles/.$EDITORrc'
alias tmuxc='$EDITOR $HOME/dotfiles/.tmux.conf'
alias zshrc='$EDITOR $HOME/dotfiles/.zshrc'
alias zs='source ~/.zshrc'

alias ec2='$EDITOR $HOME/dotfiles/aws/ec2.sh'

#  git
alias gs='git status'
alias ga='git add '
alias gc='git commit -m '
alias gca='git commit --amend'
alias gp='git push origin '
alias gls='clear && git status --short'
alias gall='git add * && git add -u && git commit -m "sync all the things" && git push origin master'
alias amend='git commit --amend'
alias cred='git config credential.helper store'
alias gd='git diff --staged'
alias nb='git checkout -b'
alias cb='git checkout '
alias db='git branch -D '
alias gmv='git mv '

#  tmux
alias t='tmux new'
alias ta='tmux a #'
alias tn='tmux new'
alias tl='tmux ls'

#  misc
alias cheat='$EDITOR $HOME/personal/lists/cheat_sheet.md'
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'
alias quotes='$EDITOR $HOME/personal/lists/quotes.md'

#  grip
alias grip='source $HOME/personal/github-pass.sh; grip --user $guser --pass $gpass'

# gridcog
alias ca='conda activate gridcog'
alias dac='conda deactivate'
alias grid='cd $HOME/gridcog'
alias gridd='cd $HOME/gridcog/services/data_ingestion'
alias perg='cd $HOME/gridcog-personal'
alias gridp='cd $HOME/gridcog-personal'
alias res='cd $HOME/research/research'

alias wd='cd ~/feeds'
alias fe='cd ~/feeds'

alias j='z'

alias mat='cmatrix'

alias di='cd ~/feeds/feedsd/data_ingestion'
alias lo='cd ~/personal/logging-my-life'

exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists bat; then
  alias cat='bat'
else
  :
fi

alias bake='make'

alias notes='cd ~/dss/notes/neu-notes'
alias funcs='vi ~/dotfiles/funcs.sh'

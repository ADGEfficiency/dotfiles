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
    export FZF_DEFAULT_OPTS='--height 40% --preview "bat -p {} 2>/dev/null || tree -C -L 2 {}" --preview-window=down:50%:wrap --border=none'
    export FZF_CTRL_R_OPTS='--height 20% --no-preview'
}

git_fzf_init() {
    # Checkout branch with commit preview
    alias fbr='git branch -a | fzf --preview "git log --oneline --graph --date=short --color=always --pretty=format:\"%C(auto)%cd %h%d %s\" {1} | head -20" | sed "s/^[* ]*//" | xargs git checkout'

    # Browse commit history with diff preview
    alias fshow='git log --oneline --all | fzf --preview "git show --stat --color=always {1}" --preview-window=right:60% | cut -d" " -f1 | xargs git show'

    # Interactive git status + add
    alias fga='git -c color.status=always status --short | fzf --multi --ansi --preview "git diff --color=always -- {2}" | awk "{print \$2}" | xargs git add'

    # Checkout branch/tag with interactive selection
    alias fco='git branch -a --format="%(refname:short)" | fzf --preview "git log --oneline --graph --color=always {} | head -15" | xargs git checkout'

    # Browse and apply stashes with preview
    alias fstash='git stash list | fzf --preview "git stash show --stat --color=always {1}" --preview-window=right:50% | cut -d: -f1 | xargs git stash pop'

    # Interactive git log browser with diff preview
    alias flog='git log --oneline --all --decorate | fzf --preview "git show --color=always {1}" --preview-window=right:60% --bind "enter:execute(git show {1} | less -R)"'

    # Delete branches (local and remote)
    alias fbd='git branch | fzf --multi --preview "git log --oneline --graph --color=always {} | head -10" | xargs git branch -d'
}

# Unified project switching with tmux + fzf
tms() {
    local session
    # Search for git repos and common project directories
    session=$(find ~/projects ~/work ~/personal ~/dotfiles -maxdepth 3 -type d \( -name .git -o -name node_modules -o -name .venv -o -name __pycache__ \) -prune -o -type d -print 2>/dev/null | \
        grep -v "^$" | \
        fzf --preview 'ls -la {}' --preview-window=right:30% --prompt="Project: ")

    if [[ -n "$session" ]]; then
        local name=$(basename "$session" | tr . _)
        tmux has-session -t="$name" 2>/dev/null || tmux new-session -ds "$name" -c "$session"
        tmux switch-client -t "$name" 2>/dev/null || tmux attach -t "$name"
    fi
}
alias tp='tms'

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
  source $HOME/dotfiles/zsh/.zprezto
  source $HOME/dotfiles/dotfiles/common/.zpreztorc
  source $HOME/dotfiles/zsh/.zprezto/init.zsh
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
# Use cached completion dump for faster loading (skip security check)
compinit -C
autoload -Uz $HOME/dotfiles/zsh/custom-autocomplete/todo

export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000000
export HISTSIZE=$HISTFILESIZE
SAVEHIST=$HISTSIZE

# History optimization: deduplication and sharing
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first
setopt HIST_IGNORE_DUPS          # Don't record consecutive duplicates
setopt HIST_IGNORE_ALL_DUPS      # Remove older duplicate from history
setopt HIST_FIND_NO_DUPS         # Don't show duplicates in search
setopt HIST_SAVE_NO_DUPS         # Don't save duplicates to file
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks from commands
export AWS_LOG_LEVEL=3

alias brew='arch -arm64 brew'
source ~/dotfiles/macos/pyenv-flags

# custom ipython config
export IPYTHONDIR="$HOME/dotfiles/.ipython"

# need a fancy npm setup when npm manages nix - requires a .npmrc with a prefix
# export PATH=~/.npm-packages/bin:$PATH
# export NODE_PATH=~/.npm-packages/lib/node_modules
# export PATH="/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:$PATH"

pyenv_init
starship_init
flyctl_init

# Lazy-load mise for faster startup (only initialize on first use)
mise() {
  unfunction mise
  eval "$(command mise activate zsh)"
  mise "$@"
}

# Lazy-load zoxide (only initialize on first use of z/zi commands)
z() {
  unfunction z zi 2>/dev/null
  eval "$(zoxide init zsh)"
  z "$@"
}
zi() {
  unfunction z zi 2>/dev/null
  eval "$(zoxide init zsh)"
  zi "$@"
}

eval "$(ssh-agent)"  &>/dev/null &>/dev/null

# Lazy-load direnv (only initialize on first cd)
direnv() {
  unfunction direnv
  eval "$(command direnv hook zsh)"
  direnv "$@"
}

# done twice for a reason
pretzo_init
fzf_init
git_fzf_init
source "$HOME/dotfiles/dotfiles/common/env.sh"
source "$HOME/dotfiles/dotfiles/common/setup-path.sh"

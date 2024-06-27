# Setup fzf
# ---------
if [[ ! "$PATH" == */home/adam/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/adam/.fzf/bin"
fi

# Auto-completion
# ---------------
source "$HOME/dotfiles/fzf/completion.zsh"

# Key bindings
# ------------
source "$HOME/dotfiles/fzf/key-bindings.zsh"

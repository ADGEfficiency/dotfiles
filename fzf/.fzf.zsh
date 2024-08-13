# Setup fzf
# ---------
if [[ ! "$PATH" == */home/adam/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/adam/.fzf/bin"
fi

# Auto-completion
# ---------------
source "$HOME/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

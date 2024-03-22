# Setup fzf
# ---------
if [[ ! "$PATH" == */home/adam/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/adam/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/adam/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/adam/.fzf/shell/key-bindings.bash"

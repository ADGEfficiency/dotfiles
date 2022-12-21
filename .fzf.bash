# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/adam/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/adam/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/adam/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/adam/.fzf/shell/key-bindings.bash"

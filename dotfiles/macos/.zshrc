source $HOME/dotfiles/dotfiles/common/.zshrc
export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
# eval "$(gh copilot alias -- zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. "$HOME/.local/bin/env"

# Cache keychain eval to avoid subprocess on every startup
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(keychain --eval --quiet --agents ssh ~/.ssh/github-air ~/.ssh/macbook-pro)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Skip quote display for faster startup (can be called manually with 'quote' command)
# quote
# echo ""
# quote

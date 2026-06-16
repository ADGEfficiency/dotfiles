source $HOME/dotfiles/dotfiles/common/.zshrc
export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib

# Enable Nerd Fonts for pi powerline
export POWERLINE_NERD_FONTS=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. "$HOME/.local/bin/env"

eval "$(keychain --eval --quiet ~/.ssh/github-air ~/.ssh/macbook-pro)"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
# do not know if i need/want this...
alias brew='arch -arm64 brew'

# Skip quote display for faster startup (can be called manually with 'quote' command)
# quote
# echo ""
# quote

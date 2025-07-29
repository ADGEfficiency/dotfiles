# Enable Nix daemon
if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
end

# Source common environment variables
set -gx XDG_CONFIG_HOME ~/dotfiles
set -gx PERSONAL_PATH "$HOME/personal"
set -gx TODO "$PERSONAL_PATH/todo.md"
set -gx EDITOR nvim

alias 'claude'='npx claude'

# Add homebrew to PATH
set -gx PATH /opt/homebrew/bin $PATH

# Disable fish greeting message
set -g fish_greeting

if status is-interactive
    bass source ~/dotfiles/scripts/aliases.sh

    # Initialize keychain for SSH agent management
    if command -q keychain
        eval (keychain --eval --quiet --agents ssh ~/.ssh/github-air ~/.ssh/macbook-pro)
    end

    # Initialize Starship prompt
    if command -q starship
        set -gx STARSHIP_CONFIG ~/dotfiles/starship/starship.toml
        starship init fish | source
    end
    
    # Aliases
    alias s='search'
    
    # Setup fzf
    set -gx PATH ~/.fzf/bin $PATH
    
end

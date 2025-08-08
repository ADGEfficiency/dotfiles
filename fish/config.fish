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
alias 't'='tmux new'

# Add homebrew to PATH
set -gx PATH /opt/homebrew/bin $PATH

# Disable fish greeting message
set -g fish_greeting

if status is-interactive
    bass source ~/dotfiles/scripts/aliases.sh
    starship init fish | source
    set -gx PATH ~/.fzf/bin $PATH
end

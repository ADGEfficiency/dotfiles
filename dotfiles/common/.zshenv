bash $HOME/dotfiles/scripts/trace.sh "$0"
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
export EDITOR=$(which nvim)
if command -v launchctl >/dev/null 2>&1; then
  launchctl setenv XDG_CONFIG_HOME $XDG_CONFIG_HOME
fi
source $HOME/dotfiles/scripts/funcs.sh
source $HOME/dotfiles/scripts/aliases.sh

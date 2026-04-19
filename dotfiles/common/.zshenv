bash $HOME/dotfiles/scripts/trace.sh "$0"
export EDITOR=$(which nvim)
export XDG_CONFIG_HOME=$HOME/dotfiles
if command -v launchctl >/dev/null 2>&1; then
  launchctl setenv XDG_CONFIG_HOME $XDG_CONFIG_HOME
fi
source $HOME/dotfiles/scripts/funcs.sh
source $HOME/dotfiles/scripts/aliases.sh

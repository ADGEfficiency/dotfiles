trace() { [[ $TRACE == 1 ]] && print "👋 from $1" }
trace "$0"

export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
if command -v launchctl >/dev/null 2>&1; then
  launchctl setenv XDG_CONFIG_HOME $XDG_CONFIG_HOME
fi
source $HOME/dotfiles/scripts/funcs.sh
source $HOME/dotfiles/scripts/aliases.sh

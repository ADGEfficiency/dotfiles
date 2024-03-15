export XDG_CONFIG_HOME=~/dotfiles

#  nix - if daemon exists, execute it
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
export EDITOR=$(which nvim)

if command -v launchctl >/dev/null 2>&1; then
  launchctl setenv XDG_CONFIG_HOME $XDG_CONFIG_HOME
fi

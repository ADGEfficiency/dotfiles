# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

echo dotfiles/.bash_profile

# if running bash
if [ "$BASH_VERSION" != "" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -e /home/adam/.nix-profile/etc/profile.d/nix.sh ]; then . /home/adam/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(zoxide init bash)"

# pyenv
source "$HOME/dotfiles/macos/pyenv-flags"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

eval "$(ssh-agent)"
eval "$(direnv hook bash)"
. ~/.keychain/"$(uname -n)"-sh
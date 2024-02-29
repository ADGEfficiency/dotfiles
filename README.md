# dotfiles

Setup and configuration for a terminal based developer workflow.

## Bash, Zsh & Git

Setup `.bashrc`, `.zshrc` & `.gitconfig` in `$HOME`:

```shell-session
$ make dotfiles
```

This runs a script `./dotfiles/setup.sh` which either:

- appends to your `rc` files in `$HOME`, 
- copies over files in `$HOME` for `.gitignore`, `.gitconfig` and `.npmrc`.

Beware running this multiple times, as you will end up sourcing the `rc` files multiple times.

Beware overwriting your `.gitignore`, `.gitconfig` and `.npmrc` files in `$HOME`.

## Linux

Setup an Linux machine:

```shell-session
$ make setup-linux OS=linux
```

This will also setup dependencies with Nix from `./nix/default.nix`.

## MacOS

Setup an MacOS machine:

```shell-session
$ make setup-macos OS=macoS
```

This will also setup dependencies with Nix from `./nix/default.nix`.

## Global Python Virtual Env

Install pyenv and pyenv-virtualenv:

```bash
$ make python
```

This will setup a global Python installation in a pyenv virtual environment.

## Neovim

Neovim setup is in [./nvim](https://github.com/ADGEfficiency/dotfiles/tree/master/nvim) -- it's a Lua based setup.

To use my Neovim setup, put this folder into `$XDG_CONFIG_HOME`.

## Getting Kitty to Play Nice on MacOS

Had weird issue with the first execution of Kitty not loading the config correctly - fixed with:

```
# ~/Library/LaunchAgents/setenv.XDG_CONFIG_HOME.plist

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>setenv.XDG_CONFIG_HOME</string>
  <key>ProgramArguments</key>
  <array>
    <string>sh</string>
    <string>-c</string>
    <string>launchctl setenv XDG_CONFIG_HOME $HOME/dotfiles</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>

$ launchctl load ~/Library/LaunchAgents/setenv.XDG_CONFIG_HOME.plist
```

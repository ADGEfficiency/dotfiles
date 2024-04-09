# Dotfiles

Setup and configuration for a terminal based developer workflow:

- Neovim for text editing,
- Zsh for shell,
- Nix for package management.

This repo should be cloned into `$HOME` and set as `$XDG_CONFIG_HOME`.

## Setup

Use GNU Stow to symlink dotfiles for Bash, Zsh, Tmux and Git:

```shell-session
$ make dotfiles OS=macos
```

Valid values for `OS` are `macos`, `wsl` or `windows`.

A script `./scripts/bootstrap-stow.sh` will attempt to bootstrap Stow if it's not already available. Bootstrapping is not setup for Windows because Windows is awful.

You can run the setup without bootstrapping Stow with:

```shell-session
$ make dotfiles OS=macos -o bootstrap-stow
```

## Ubuntu

Setup an Ubuntu machine:

```shell-session
$ make setup-ubuntu OS=ubuntu
```

This will also setup dependencies with Nix from `./nix/default.nix`.

## macOS

Setup an macOS machine:

```shell-session
$ make setup-macos OS=macos
```

This will also setup dependencies with Nix from `./nix/default.nix`.

## Global Python Virtual Environment

This will:

- install `pyenv` and `pyenv-virtualenv`,
- setup a global Python installation in a pyenv virtual environment.

```bash
$ make python
```

## Neovim

Neovim config is in `./nvim`. To use the Neovim setup, put this folder into `$XDG_CONFIG_HOME`.

I use Lazy for package management in Neovim.

## Getting Kitty to Play Nice on macOS

Had weird issue with the first execution of Kitty not loading the `kitty.conf` correctly - fixed with:

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

#!/usr/bin/env bash
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install build-essential
~/.fzf/install --key-bindings --completion --no-update-rc
./vim
./rust
./pyenv

#!/usr/bin/env bash
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install build-essential cmake keychain
sudo apt -y install build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

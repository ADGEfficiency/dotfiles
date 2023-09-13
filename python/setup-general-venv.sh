#!/usr/bin/env zsh
NAME=$1
VERSION=$2
pyenv install $VERSION
pyenv virtualenv $VERSION $NAME
echo $NAME > ~/.python-version

#!/usr/bin/env bash
NAME=general
VERSION=3.10.6
pyenv install $VERSION
pyenv virtualenv $VERSION $NAME
pip install --upgrade pip -q
pip install poetry -U -q
poetry install -q
echo $NAME > ~/.python-version

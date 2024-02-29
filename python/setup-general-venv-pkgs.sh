#!/usr/bin/env zsh
echo $PATH
pip install --upgrade pip -q
pip install poetry -U -q
cd python; poetry install --no-root

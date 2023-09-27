export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init --path --no-rehash)"
eval "$(pyenv virtualenv-init -)"

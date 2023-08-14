init_pyenv() {
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path --no-rehash)"
}
init_pyenv_venv() {
  eval "$(pyenv virtualenv-init -)"
}
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
init_pyenv
init_pyenv_venv

#!/usr/bin/env bash

HISTSIZE=100000

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# https://github.com/platformio/platformio-atom-ide-terminal/issues/196
update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
}

# vim masterrace
set -o vi
export EDITOR=vim

# don't add duplicates
export HISTCONTROL=ignoreboth:erasedups

# remember a lot
export HISTFILESIZE=10000000
export HISTSIZE=10000000

# after each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# aws
export AWS_LOG_LEVEL=3
export AWS_REGION="eu-central"

# # ------ complilation flags -------
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib -L/usr/local/opt/tcl-tk/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip3/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/readline/include -I/usr/local/opt/zlib/include -I/usr/local/opt/tcl-tk/include"

export PATH=$PATH:/usr/local/opt/tcl-tk/bin
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"

# z script
source ~/z.sh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

. "$HOME/.cargo/env"

. ~/z.sh
eval "$(zoxide init bash)"

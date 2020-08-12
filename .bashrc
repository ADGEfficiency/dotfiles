 [-f ~/.fzf.bash ] && source ~/.fzf.bash

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

# vi mode
set -o vi

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

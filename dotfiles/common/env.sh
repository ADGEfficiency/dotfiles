#!/usr/bin/env bash
export XDG_CONFIG_HOME="$HOME/.config"
export PERSONAL_PATH="$HOME/personal"
export DIRENV_LOG_FORMAT=""
# Only when dotfiles is mounted (ie not in standalone devcontainers)
if [ -d "$HOME/dotfiles/config/pi" ]; then
  export PI_CODING_AGENT_DIR="$HOME/dotfiles/config/pi"
fi
# Sessions stored locally so pi works when dotfiles is mounted read-only (ie devcontainers)
export PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions"

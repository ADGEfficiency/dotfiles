#!/usr/bin/env bash
DEFAULT_RATIO=0.3
RATIO=${1:-$DEFAULT_RATIO}
KITTY=$(yabai -m query --windows | jq '.[] | select(.app == "kitty")' | jq '.id')
yabai -m window "$KITTY" --ratio abs:"$RATIO"

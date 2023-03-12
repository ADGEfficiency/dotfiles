#!/usr/bin/env bash
WINDOW_ID=$(yabai -m query --windows | jq '.[] | select(.app == "Firefox")' | jq '.id')
KITTY=$(yabai -m query --windows | jq '.[] | select(.app == "kitty")' | jq '.id')
# yabai -m window $WINDOW_ID --warp $KITTY
yabai -m window $KITTY --ratio abs:0.3

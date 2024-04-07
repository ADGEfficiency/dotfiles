#!/bin/bash

# copies the most recent screenshot from the desktop to $1
# macos specific

screenshot_dir=~/Desktop
latest_screenshot=$("ls" -t "${screenshot_dir}"/Screenshot* | head -n 1)
echo "latest screenshot: ${latest_screenshot}\ncopying to: ${1}"
if [ -z "${latest_screenshot}" ]; then
    echo "No screenshot found."
    exit 1
fi
mv "${latest_screenshot}" "$1"

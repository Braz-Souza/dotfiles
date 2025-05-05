#!/bin/sh

NEW_FILE="$(date +'%m-%d-%Y-%H%M%S').png"
mkdir -p ~/Documents/Screenshots && scrot ~/Documents/Screenshots/$NEW_FILE &&
  xclip -selection clipboard -t image/png -i ~/Documents/Screenshots/$NEW_FILE

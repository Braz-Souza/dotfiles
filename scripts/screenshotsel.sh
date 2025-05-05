#!/bin/sh

NEW_FILE="$(date +'%m-%d-%Y-%H%M%S').png"
mkdir -p ~/Documents/Screenshots && scrot ~/Documents/Screenshots/$NEW_FILE --select --line mode=edge &&
  xclip -selection clipboard -t image/png ~/Documents/Screenshots/$NEW_FILE

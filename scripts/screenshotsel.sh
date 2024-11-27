#!/bin/sh

NEW_FILE="$(date +'%m-%d-%Y-%H%M%S').png"
mkdir -p /home/vazio/Documents/Screenshots && scrot /home/vazio/Documents/Screenshots/$NEW_FILE --select --line mode=edge &&
  xclip -selection clipboard -t image/png /home/vazio/Documents/Screenshots/$NEW_FILE

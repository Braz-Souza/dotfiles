#!/bin/sh

# Change location of dotfiles to current user home as a hidden directory
CURRENT_DIR=$(dirname "$(realpath "$0")")
DOTFILES=/home/$USER/.dotfiles
if [[ $CURRENT_DIR != $DOTFILES ]]; then
	mv $CURRENT_DIR $DOTFILES
fi

# Define script and base programs directory 
SCRIPTS_DIR=$DOTFILES/scripts
BASE=$DOTFILES/base

# Define every program to make after necessary changes
DWM=$BASE/dwm
ST=$BASE/st
SLSTATUS=$BASE/slstatus
SLOCK=$BASE/slock
DMENU=$BASE/dmenu

# Pass scripts directory to DWM to use it to execute script as shortcuts
cp $DWM/config.def.h $DWM/config.def.h.orig
sed -i "s|SCRIPTS_DIR|${SCRIPTS_DIR}|g" $DWM/config.def.h

# Pass user name to SLOCK to lock screen when needed
cp $SLOCK/config.def.h $SLOCK/config.def.h.orig
sed -i "s|USER_NAME|${USER}|g" $SLOCK/config.def.h

# Install Requirements
sudo pacman -Syu
sudo pacman -S feh xcompmgr scrot ibus xclip pipewire pipewire-pulse xautolock ttf-fira-code otf-ipafont ttf-baekmuk syncthing

# Install DWM
cd $DWM && sudo make clean install
cd $ST && sudo make clean install
cd $SLSTATUS && sudo make clean install
cd $SLOCK && sudo make clean install
cd $DMENU && sudo make clean install

# Copy needed sh scripts
cp -r $DOTFILES/homeuser/.* /home/$USER

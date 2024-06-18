#!/bin/bash
echo "alias hiraku='sudo sh ~/dotfiles/scripts/open-usb.sh'" >> ~/.bashrc
echo "alias shuuryou='sudo sh ~/dotfiles/scripts/close-usb.sh'" >> ~/.bashrc
echo "Please, to use the alias predefined by MYSELF in this terminal use source ~/.bashrc"
echo "The hiraku command executes MY predefined open-usb command designed to decrypt and mount MY usb flash drive"
echo "The shuuryou command executes MY predefined close-usb design to umount and crypt MY usb flash drive"

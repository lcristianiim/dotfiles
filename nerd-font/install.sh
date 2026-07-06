#!/bin/bash
# Download Hack Nerd Font from official releases
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip -o /tmp/HackNerdFont.zip
# create font folder
mkdir -p ~/.local/share/fonts
# extract to font folder
unzip -o /tmp/HackNerdFont.zip -d ~/.local/share/fonts/
# clean cache
echo "=========="
echo "Cleaning cache"
fc-cache -f
# display hack font
echo "=========="
echo "Listing installed font"
fc-list | grep Hack
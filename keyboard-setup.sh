#!/bin/bash
# Keyboard repeat rate for GNOME/Wayland (Fedora)
# Equivalent to old X11: xset r rate 190 60

gsettings set org.gnome.desktop.peripherals.keyboard delay 190
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 17

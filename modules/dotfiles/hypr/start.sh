#!/usr/bin/env bash

# Wallpaper daemon
swww init &
swww image ~/.pictures/giant-woman.jpg

# Network manager applet
nm-applet --indicator &

waybar &

dunst

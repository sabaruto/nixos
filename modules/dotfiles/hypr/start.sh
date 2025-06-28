#!/usr/bin/env bash

# Wallpaper daemon
swww-daemon &
swww img ~/.pictures/giant-woman.jpg

# Network manager applet
nm-applet --indicator &

waybar &

dunst

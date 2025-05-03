#!/usr/bin/env bash

# Wallpaper daemon
swww init &
swww image ~/Pictures/Desktop/giant-woman.jpg

# Network manager applet
nm-applet --indicator &

waybar &

dunst

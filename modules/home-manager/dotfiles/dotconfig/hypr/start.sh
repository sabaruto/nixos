#!/usr/bin/env bash

# Wallpaper daemon
swww init &

# Network manager applet
nm-applet --indicator &

waybar &

dunst

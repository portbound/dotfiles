#!/bin/bash

WINDOW_CLASS="com.mitchellh.ghostty" # e.g., "Alacritty", "kitty", "Gnome-terminal"

# Get the current window's floating state
is_floating=$(hyprctl activewindow -j | jq '.floating')

# Get monitor size (optional, for more precise sizing, but % works well too)
# MONITOR_WIDTH=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .width')

if [ "$is_floating" = "true" ]; then
    # Window is floating, so tile it back
    hyprctl dispatch togglefloating
else
    # Window is tiled, so float, resize, and center it.
    hyprctl --batch "dispatch togglefloating; dispatch resizeactive exact 75% 90%; dispatch centerwindow 1"
fi

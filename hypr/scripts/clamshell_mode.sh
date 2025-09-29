#!/usr/bin/env zsh

INTERNAL_MONITOR="eDP-1"
INTERNAL_MONITOR_ENABLE_CONFIG="eDP-1, preferred, auto, 1"
EXTERNAL_MONITOR_PATTERN="HDMI-A-1|DP-10" 

if [[ "$(hyprctl monitors)" =~ "$EXTERNAL_MONITOR_PATTERN" ]]; then
  if [[ $1 == "close" ]]; then
    hyprctl keyword monitor "$INTERNAL_MONITOR, disable"
  elif [[ $1 == "open" ]]; then
    hyprctl keyword monitor "$INTERNAL_MONITOR_ENABLE_CONFIG"
  fi
fi

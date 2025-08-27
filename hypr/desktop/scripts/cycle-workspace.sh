#!/bin/bash

# Direction: "next" or "prev"
DIRECTION=$1

# Get active monitor
ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true) | .name')

# Get active workspace on that monitor
ACTIVE_WS=$(hyprctl monitors -j | jq -r --arg MON "$ACTIVE_MONITOR" '.[] | select(.name==$MON) | .activeWorkspace.id')

# Workspace range per monitor (customize as needed)
if [[ "$ACTIVE_MONITOR" == "DP-1" ]]; then
  MIN=1
  MAX=5
elif [[ "$ACTIVE_MONITOR" == "HDMI-A-1" ]]; then
  MIN=6
  MAX=10
else
  MIN=1
  MAX=5
fi

# Determine new workspace
if [[ "$DIRECTION" == "next" ]]; then
  if (( ACTIVE_WS < MAX )); then
    NEW_WS=$((ACTIVE_WS + 1))
  else
    NEW_WS=$MIN
  fi
else
  if (( ACTIVE_WS > MIN )); then
    NEW_WS=$((ACTIVE_WS - 1))
  else
    NEW_WS=$MAX
  fi
fi

# Switch to the new workspace
hyprctl dispatch workspace "$NEW_WS"
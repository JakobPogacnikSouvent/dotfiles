#!/bin/bash

# Direction: "next" or "prev"
DIRECTION=$1

# Get active monitor
ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true) | .name')

# Get workspace info
MON_INFO=$(hyprctl monitors -j | jq -r --arg MON "$ACTIVE_MONITOR" '.[] | select(.name==$MON)')

ACTIVE_WS_ID=$(echo "$MON_INFO" | jq -r '.activeWorkspace.id')
SPECIAL_WS_NAME=$(echo "$MON_INFO" | jq -r '.specialWorkspace.name')

# If in a special workspace, toggle it off
if [[ "$SPECIAL_WS_NAME" != "" ]]; then
    # Strip "special:" prefix
    SPECIAL_WS_NAME="${SPECIAL_WS_NAME#special:}"
    # hyprctl dispatch togglespecialworkspace "$SPECIAL_WS_NAME"
    hyprctl dispatch "hl.dsp.workspace.toggle_special('$SPECIAL_WS_NAME')"
    exit 0
fi

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
# hyprctl dispatch workspace "$NEW_WS"
hyprctl dispatch "hl.dsp.focus({ workspace = $NEW_WS })"
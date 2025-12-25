#!/bin/bash

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
    hyprctl dispatch togglespecialworkspace "$SPECIAL_WS_NAME"
    exit 0
fi

# Else cycle workspaces
MIN=1
MAX=10

if [[ "$DIRECTION" == "next" ]]; then
  if (( ACTIVE_WS_ID < MAX )); then
    NEW_WS=$((ACTIVE_WS_ID + 1))
  else
    NEW_WS=$MIN
  fi
else
  if (( ACTIVE_WS_ID > MIN )); then
    NEW_WS=$((ACTIVE_WS_ID - 1))
  else
    NEW_WS=$MAX
  fi
fi

hyprctl dispatch workspace "$NEW_WS"
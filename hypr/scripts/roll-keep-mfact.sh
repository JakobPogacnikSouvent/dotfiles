#!/bin/bash
# Usage: ./roll_and_restore.sh rollnext or rollprev

COMMAND=$1

# 1. Get Workspace ID (Checking for Special Workspace first)
MONITOR_DATA=$(hyprctl monitors -j | jq '.[] | select(.focused == true)')
SPECIAL_ID=$(echo "$MONITOR_DATA" | jq -r '.specialWorkspace.id')

if [ "$SPECIAL_ID" != "0" ] && [ "$SPECIAL_ID" != "null" ]; then
    WS="special_$SPECIAL_ID"
else
    WS=$(echo "$MONITOR_DATA" | jq -r '.activeWorkspace.id')
fi

STATE_FILE="/tmp/hypr_mfact_$WS"

# 2. Perform the movement
hyprctl dispatch layoutmsg "$COMMAND"

# 3. Restore the mfact for this specific workspace
if [ -f "$STATE_FILE" ]; then
    SAVED_MFACT=$(cat "$STATE_FILE")
    hyprctl dispatch layoutmsg mfact exact "$SAVED_MFACT"
else
    # Optional: Reset to default if no state file exists to prevent 
    # carry-over from a previous workspace's manual adjustment
    DEFAULT_MFACT=$(hyprctl getoption master:mfact -j | jq '.float')
    hyprctl dispatch layoutmsg mfact exact "$DEFAULT_MFACT"
fi

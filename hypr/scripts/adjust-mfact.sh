#!/bin/bash
# Usage: ./adjust-mfact.sh +0.05 or ./adjust-mfact.sh -0.05

STEP=$1

# 1. Get Workspace ID (Check for special workspace first)
# We look at the active monitor to see if a special workspace is focused
MONITOR_DATA=$(hyprctl monitors -j | jq '.[] | select(.focused == true)')
SPECIAL_ID=$(echo "$MONITOR_DATA" | jq -r '.specialWorkspace.id')

if [ "$SPECIAL_ID" != "0" ] && [ "$SPECIAL_ID" != "null" ]; then
    WS="special_$SPECIAL_ID"
else
    WS=$(echo "$MONITOR_DATA" | jq -r '.activeWorkspace.id')
fi

echo "$WS"
STATE_FILE="/tmp/hypr_mfact_$WS"

# 2. Get current mfact (default to 0.5 if no file exists)
if [ -f "$STATE_FILE" ]; then
    CURRENT=$(cat "$STATE_FILE")
else
    # Fallback: get the global default
    CURRENT=$(hyprctl getoption master:mfact -j | jq '.float')
fi

# 3. Calculate new value
NEW=$(echo "$CURRENT $STEP" | bc)

# 4. Clamp values
if (( $(echo "$NEW < 0.05" | bc -l) )); then NEW=0.05; fi
if (( $(echo "$NEW > 0.95" | bc -l) )); then NEW=0.95; fi

# 5. Apply and Save
hyprctl dispatch layoutmsg mfact exact "$NEW"
echo "$NEW" > "$STATE_FILE"
echo "$NEW"

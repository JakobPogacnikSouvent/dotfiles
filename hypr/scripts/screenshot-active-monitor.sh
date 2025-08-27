#!/bin/bash

MONITOR_WIDTH=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | .width')
MONITOR_HEIGHT=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | .height')
MONITOR_X=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | .x')
MONITOR_Y=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | .y')

GEOMETRY="${MONITOR_X},${MONITOR_Y} ${MONITOR_WIDTH}x${MONITOR_HEIGHT}"

grim -g "$GEOMETRY" - | wl-copy
#!/bin/bash

current_ws=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true) | .activeWorkspace | .id')

echo "$current_ws"

windows_on_current_ws=$(hyprctl clients -j | jq --argjson ws "$current_ws" '.[] | select(.workspace.id == $ws)')

echo "$windows_on_current_ws"

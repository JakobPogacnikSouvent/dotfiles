#!/bin/bash

echo "$1" > /tmp/hypr_current_submap
hyprctl dispatch submap $1
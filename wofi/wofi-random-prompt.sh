#!/bin/bash

precept=$(~/.local/bin/zote)

if pgrep -x "wofi" > /dev/null; then
# wofy already running
  exit 0
else
  wofi -p "${precept}"
fi

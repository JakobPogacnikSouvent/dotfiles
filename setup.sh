#!/bin/bash

read -p "Enter device type ((1)desktop / (2)laptop): " device

sync_folder() {
    local src="$1/"
    local dest="$HOME/.config/$1/"
    mkdir -p "$dest"
    rsync -a --delete "$src" "$dest"
}

sync_folder "alacritty"
sync_folder "nvim"
sync_folder "wofi"
sync_folder "neofetch"

mkdir -p "$HOME/.config/hypr"
mkdir -p "$HOME/.config/waybar"

rsync -a --delete --exclude 'desktop/' --exclude 'laptop/' hypr/ "$HOME/.config/hypr/"
rsync -a --delete --exclude 'desktop/' --exclude 'laptop/' waybar/ "$HOME/.config/waybar/"


if [[ "$device" == "desktop" || "$device" == "1" ]]; then
    echo "Syncing desktop configs..."
    rsync -a hypr/desktop/monitors.conf "$HOME/.config/hypr/"
    rsync -a hypr/desktop/input.conf "$HOME/.config/hypr/"
    
    rsync -a hypr/desktop/scripts/cycle-workspace.sh "$HOME/.config/hypr/scripts/"
    
    rsync -a waybar/desktop/config.jsonc "$HOME/.config/waybar/"
elif [[ "$device" == "laptop" || "$device" == "2" ]]; then
    echo "Syncing laptop configs..."
    rsync -av hypr/laptop/monitors.conf "$HOME/.config/hypr/"
    rsync -a hypr/laptop/input.conf "$HOME/.config/hypr/"

    rsync -a hypr/laptop/scripts/cycle-workspace.sh "$HOME/.config/hypr/scripts/"
    
    rsync -a waybar/laptop/config.jsonc "$HOME/.config/waybar/"
else
    echo "Error: Invalid device type. Please enter 'desktop' or 'laptop'."
    exit 1
fi

hyprctl reload
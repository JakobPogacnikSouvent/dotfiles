#!/bin/bash

read -p "Enter device type ((1)desktop / (2)laptop): " device

case "$device" in
    1 | desktop) device="desktop" ;;
    2 | laptop)  device="laptop"  ;;
    *) 
        echo "Error: Invalid device type. Please enter 'desktop' or 'laptop'."
        exit 1
        ;;
esac

sync_folder() {
    local src="$HOME/dotfiles/$1/"
    local dest="$HOME/.config/$1/"
    mkdir -p "$dest"
    rsync -a --delete "$src" "$dest"
}

### General configs ###

sync_folder "alacritty"
sync_folder "nvim"
sync_folder "wofi"
sync_folder "neofetch"

# wallpaper
mkdir -p "$HOME/.config/wallpapers"
rsync -a "$HOME/dotfiles/wallpapers/wallhaven-exl22k.jpg" "$HOME/.config/wallpapers"

# hypr
mkdir -p "$HOME/.config/hypr"
rsync -a --delete --exclude 'desktop/' --exclude 'laptop/' "$HOME/dotfiles/hypr/" "$HOME/.config/hypr/"

# waybar
mkdir -p "$HOME/.config/waybar"
rsync -a --delete --exclude 'desktop/' --exclude 'laptop/' "$HOME/dotfiles/waybar/" "$HOME/.config/waybar/"

### Device Specific configs ###

# hypr
mkdir -p "$HOME/.config/hypr/scripts"
mkdir -p "$HOME/.config/waybar"

rsync -a "$HOME/dotfiles/hypr/$device/monitors.conf" "$HOME/.config/hypr/"
rsync -a "$HOME/dotfiles/hypr/$device/input.conf" "$HOME/.config/hypr/"
rsync -a "$HOME/dotfiles/hypr/$device/scripts/cycle-workspace.sh" "$HOME/.config/hypr/scripts/"

# waybar
rsync -a "$HOME/dotfiles/waybar/$device/config.jsonc" "$HOME/.config/waybar/"

hyprctl reload
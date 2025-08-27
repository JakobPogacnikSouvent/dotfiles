#!/bin/bash

# Prompt for input
read -p "Enter device type ((1)desktop / (2)laptop): " device

mkdir -p ~/.config/hypr
mkdir -p ~/.config/hypr/scripts
mkdir -p ~/.config/wallpapers
mkdir -p ~/.config/waybar

# Check the input
if [[ "$device" == "desktop" || "$device" == "1" ]]; then
    echo "You selected desktop. Performing desktop-related tasks..."
    cp ~/dotfiles/hypr/desktop/monitors.conf ~/.config/hypr/
    cp ~/dotfiles/hypr/desktop/scripts/cycle-workspace.sh ~/.config/hypr/scripts/
    cp ~/dotfiles/waybar/desktop/config.jsonc ~/.config/waybar/
elif [[ "$device" == "laptop" || "$device" == "2" ]]; then
    echo "You selected laptop. Performing laptop-related tasks..."
    cp ~/dotfiles/hypr/laptop/monitors.conf ~/.config/hypr/
    cp ~/dotfiles/hypr/laptop/scripts/cycle-workspace.sh ~/.config/hypr/scripts/
    cp ~/dotfiles/waybar/laptop/config.jsonc ~/.config/waybar/
else
    echo "Error: Invalid device type. Please enter 'desktop' or 'laptop'."
    exit 1
fi

cp ~/dotfiles/hypr/*.conf ~/.config/hypr/
cp -r ~/dotfiles/hypr/scripts ~/.config/hypr/

cp ~/dotfiles/wallpapers/wallhaven-exl22k.jpg ~/.config/wallpapers/

cp -r ~/dotfiles/alacritty ~/.config/alacritty

cp -r ~/dotfiles/nvim ~/.config/nvim

cp ~/dotfiles/waybar/*.css ~/.config/waybar/

cp -r ~/dotfiles/wofi ~/.config/wofi

cp -r ~/dotfiles/neofetch ~/.config/neofetch

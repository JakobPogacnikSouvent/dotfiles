#!/bin/bash  

current_layout=$(hyprctl getoption general:layout | grep '^str:' | awk '{print $2}')

if [[ "$current_layout" == "dwindle" ]]; then  
	# hyprctl keyword general:layout "master"
	hyprctl eval "hl.config({general = {layout = 'master'}})"
	# TODO: Set mfact here
else  
	# hyprctl keyword general:layout "dwindle"  
	hyprctl eval "hl.config({general = {layout = 'dwindle'}})"
fi  

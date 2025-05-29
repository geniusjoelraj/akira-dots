#!/bin/bash
sleep 0.2
wall=$(<"$HOME/.current_wallpaper")

if [[ -f "$wall" ]]; then
  # hyprctl hyprpaper unload all
  echo $wall
  hyprctl hyprpaper reload ,"$wall"
  # hyprctl hyprpaper wallpaper "eDP-1,$wall" # Replace eDP-1 with your actual monitor
fi

#!/bin/bash

wall=$(zenity --file-selection --title="Select a Wallpaper" --filename="$HOME/Pictures/Wallpapers/")

if [[ -n "$wall" && -f "$wall" ]]; then
  echo "$wall" >"$HOME/.current_wallpaper"
  bash ~/.scripts/auto_accent
  if swww img "$wall" \
    --transition-type wipe \
    --transition-step 200 \
    --transition-fps 59; then
    notify-send -i "$HOME/Pictures/hyprland-logo.png" "Hyprpaper" "Wallpaper changed successfully" -t 1000
  else
    notify-send -i "$HOME/Pictures/hyprland-logo-error.png" "Hyprpaper" "Failed to apply wallpaper (swww error)" -t 1000
  fi
else
  notify-send -i "$HOME/Pictures/hyprland-logo-error.png" "Hyprpaper" "Wallpaper not changed or file not valid" -t 1000
fi

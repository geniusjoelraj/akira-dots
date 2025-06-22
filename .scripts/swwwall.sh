#!/bin/bash

wall=$(zenity --file-selection --title="Select a Wallpaper" --filename="$HOME/Pictures/Wallpapers/")

if [[ -n "$wall" && -f "$wall" ]]; then
  echo "$wall" >"$HOME/.current_wallpaper"
  bash ~/.scripts/auto_accent
  # pgrep -x swww-daemon >/dev/null || setsid swww-daemon >/dev/null 2>&1 </dev/null
  if swww img "$wall" \
    --resize fit \
    --transition-type wipe \
    --transition-fps 59; then # --transition-step 200 \
    notify-send -i "$HOME/Pictures/hyprland-logo.png" "Swww" "Wallpaper changed successfully" -t 1000
  else
    notify-send -i "$HOME/Pictures/hyprland-logo-error.png" "Swww" "Failed to apply wallpaper (swww error)" -t 1000
  fi
else
  notify-send -i "$HOME/Pictures/hyprland-logo-error.png" "Swww" "Wallpaper not changed or file not valid" -t 1000
fi

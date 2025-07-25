#!/bin/bash

image_dir="$HOME/Pictures/Wallpapers/"
images=("$image_dir"/*)

image_list=""
for img in "${images[@]}"; do
  image_list+=$(basename "$img" | cut -d. -f1)"\x00icon\x1f${img}\n"
done

selected_image=$(printf '%b' "$image_list" | rofi -dmenu -p "Select wallpaper")

for img in "${images[@]}"; do
  if [[ "$(basename "$img" | cut -d. -f1)" = "$selected_image" ]]; then
    selected_image_path="$img"
    break
  fi
done

if [ -n "$selected_image_path" ]; then
  ln -sf "$selected_image_path" ~/Pictures/Wallpapers

  if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    swww img $selected_image_path
  else
    i3-msg restart
  fi

  notify-send -a "Wallpaper selector" "Wallpaper changed" "$selected_image_path" -i "$(cat ~/.current_wallpaper)"
fi

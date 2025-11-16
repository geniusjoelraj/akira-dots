if [[ $(pidof waybar) ]]; then
  pkill waybar
else
  waybar
fi

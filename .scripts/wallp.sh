wall=$(zenity --file-selection --title="Select a Wallpaper" --filename="$HOME/Pictures/Wallpapers/")
if [[ $wall ]]; then
  echo "$wall" >"$HOME/.current_wallpaper"
  hyprctl hyprpaper reload ,"$wall" --resize fill --output eDP-1
  # auto_accent
  notify-send "Hyprpaper" "Wallpaper changed successfully"
else
  notify-send "Hyprpaper" "Wallpaper not changed"
fi

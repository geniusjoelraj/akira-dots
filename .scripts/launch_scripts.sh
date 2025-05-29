#!/usr/bin/env bash
# ls $HOME/.scripts | rofi -dmenu -theme $HOME/.config/rofi/launchers/type-4/style-4.rasi -p scripts
selected_script=$(ls "$HOME/.scripts" | rofi -dmenu -p "scripts")
if [ -n "$selected_script" ]; then
  "$HOME/.scripts/$selected_script"
fi

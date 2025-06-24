#!/usr/bin/env bash
# ls $HOME/.scripts | rofi -dmenu -theme $HOME/.config/rofi/launchers/type-4/style-4.rasi -p scripts
selected_script=$(ls "$HOME/.scripts" | rofi -dmenu -p "scripts")

if [[ "$selected_script" == "pyscripts" ]]; then
  selected_script=$(ls "$HOME/.scripts/pyscripts/" | rofi -dmenu -p "pyscripts")
  uv run "$PYSCRIPT/$selected_script/main.py" $1
fi

if [ -n "$selected_script" ]; then
  "$HOME/.scripts/$selected_script"
fi

#!/usr/bin/env bash

cliphist list | sed 's/^[0-9]\+[[:space:]]\+//' | rofi -theme "/home/tensai/.local/share/rofi/themes/rofi/launchers/type-1/style-3.rasi" -dmenu -p " clipboard " | wl-copy

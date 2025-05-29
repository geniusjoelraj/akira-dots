#!/usr/bin/env bash

cliphist list | rofi -dmenu -p "clipboard" -display-columns 2 | cliphist decode | wl-copy

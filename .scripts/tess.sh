#!/usr/bin/env bash

image=$(grim -g "$(slurp)" - | wl-copy && wl-paste >~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png)
text=$(tesseract "/home/tensai/Pictures/Screenshots/Screenshot-$(date +%F_%T).png" output)
wl-copy $(cat "/home/tensai/output.txt")

#!/usr/bin/env bash

image=$(grim -g "$(slurp)" - | wl-copy && wl-paste >~/.tess/tess.png)
text=$(tesseract "/home/tensai/.tess/tess.png" output)
cat "/home/tensai/output.txt" | wl-copy
notify-send "Copied to Clipboard" -t 3000 -r 6

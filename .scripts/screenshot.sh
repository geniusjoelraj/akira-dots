#!/usr/bin/env bash
grim -g "$(slurp -o -r -c '#ff0000ff')" -t ppm - | satty --filename - --output-filename ~/Pictures/Screenshots/Screenshot-$(date '+%F_%T').png

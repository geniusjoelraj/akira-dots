#!/usr/bin/env bash

cliphist list | sed 's/^[0-9]\+ *//' | tofi --prompt-text=" clipboard " --font-size=16 --num-results=0 --padding-top=10% --padding-left=10% | wl-copy

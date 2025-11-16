#!/bin/bash

# Define the app name for Mako configuration (optional, but good practice)
APP_NAME="Spotify-Mako"
# Define a stack tag to replace the previous notification (avoids stacking)
STACK_TAG="spotify-track-info"

playerctl --player=spotify metadata --follow \
  --format '{{ artist }}|{{ title }}' |
  while IFS="|" read -r artist title; do
    if [ -n "$title" ]; then
      COVER=$(~/.scripts/get_spotify_art.sh)
      notify-send \
        -a "$APP_NAME" \
        -t 5000 \
        -u low \
        -h string:x-dunst-stack-tag:"$STACK_TAG" \
        "$title" \
        "$artist" \
        -i $COVER
    fi
  done

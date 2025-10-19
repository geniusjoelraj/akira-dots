#!/usr/bin/env bash

tmp_art="/tmp/spotify_cover.jpg"
default_art="$HOME/.config/eww/default_cover.png"

# Get art URL from Spotify via playerctl
art=$(playerctl metadata -p spotify --format '{{mpris:artUrl}}' 2>/dev/null)

# If art is empty, use fallback
if [ -z "$art" ]; then
  cp "$default_art" "$tmp_art"
  echo "$tmp_art"
  exit 0
fi

# Handle file:// and http(s) URLs
if [[ "$art" == file://* ]]; then
  cp "${art#file://}" "$tmp_art"
else
  curl -sL "$art" -o "$tmp_art"
fi

echo "$tmp_art"

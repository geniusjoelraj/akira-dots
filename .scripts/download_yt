#!/usr/bin/env bash

url=$(rofi -dmenu -p "URL")

if [ -z "$url" ]; then
  notify-send "No URL entered"
  exit 1
fi

notify-send "Download started"
yt-dlp "$url" -o "~/Media/Youtube/%(title)s.mp4"

if [ $? -ne 0 ]; then
  notify-send "Download failed" -i "error"
else
  open=$(notify-send "  Download successful" -i "youtube" --action=open="Open file")
  if [[ $open=="open" ]]; then
    dolphin "$HOME/Media/Youtube/"
  fi
fi

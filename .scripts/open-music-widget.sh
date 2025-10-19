#!/usr/bin/env bash

# --- CONFIGURATION ---
TRIGGER_MIN_X_ORIG=0
TRIGGER_MAX_X_ORIG=31
TRIGGER_MIN_Y_ORIG=1070
TRIGGER_MAX_Y_ORIG=1388

WIDGET_MIN_X=0
WIDGET_MAX_X=160
WIDGET_MIN_Y=1070
WIDGET_MAX_Y=1388

WIDGET_NAME="music-widget"

# --- LOGIC ---
is_open=false

while true; do
  # --- PRIORITY 1: Fullscreen check ---
  fullscreen=$(hyprctl clients -j | jq 'map(.fullscreen) | any(. != 0) | if . then 1 else 0 end')

  if [ "$fullscreen" -eq 1 ]; then
    TRIGGER_MIN_X=0
    TRIGGER_MAX_X=0
    TRIGGER_MIN_Y=0
    TRIGGER_MAX_Y=0
    if [ "$is_open" = true ]; then
      eww close "$WIDGET_NAME"
      is_open=false
    fi
  else
    TRIGGER_MIN_X=$TRIGGER_MIN_X_ORIG
    TRIGGER_MAX_X=$TRIGGER_MAX_X_ORIG
    TRIGGER_MIN_Y=$TRIGGER_MIN_Y_ORIG
    TRIGGER_MAX_Y=$TRIGGER_MAX_Y_ORIG
  fi

  # --- Cursor position ---
  pos=$(hyprctl cursorpos)
  Y=$(echo "$pos" | cut -d',' -f1 | xargs)
  X=$(echo "$pos" | cut -d',' -f2 | xargs)

  # Detect mouse inside trigger zone
  if ((X >= TRIGGER_MIN_X && X <= TRIGGER_MAX_X && Y >= TRIGGER_MIN_Y && Y <= TRIGGER_MAX_Y)); then
    if [ "$is_open" = false ]; then
      eww open "$WIDGET_NAME"
      is_open=true
      sleep 0.2
    fi
  fi

  # Detect mouse completely outside widget area
  if [ "$is_open" = true ]; then
    if ! ((X >= WIDGET_MIN_X && X <= WIDGET_MAX_X && Y >= WIDGET_MIN_Y && Y <= WIDGET_MAX_Y)); then
      eww close "$WIDGET_NAME"
      is_open=false
    fi
  fi

  sleep 0.05
done

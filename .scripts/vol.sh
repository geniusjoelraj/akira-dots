#!/usr/bin/env bash

function get_volume {
  vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
  echo "$vol"
}

function set_volume {
  new_volume=$1
  # Clamp the volume to a max of 1.0
  if (($(echo "$new_volume > 1.0" | bc -l))); then
    new_volume=1.0
  fi
  wpctl set-volume @DEFAULT_AUDIO_SINK@ "$new_volume"
}

function send_notification {
  vol_float=$(get_volume)
  vol_int=$(echo "$vol_float * 100 / 1" | bc)
  filled=$(($vol_int / 3))
  bar=$(printf '󰝤%.0s' $(seq 1 $filled))
  notify-send "Volume: $vol_int%" "$bar" -r 5 -i "audio-volume-high-symbolic" -t 1000
}

case $1 in
up)
  current=$(get_volume)
  new=$(echo "$current + 0.05" | bc)
  set_volume "$new"
  send_notification
  ;;
down)
  current=$(get_volume)
  new=$(echo "$current - 0.05" | bc)
  set_volume "$new"
  send_notification
  ;;
mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  if [ -n "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')" ]; then
    notify-send "Toggled mute" -r 5 -i "audio-volume-muted-symbolic" -t 1000
  else
    notify-send "Toggled mute" -r 5 -i "audio-volume-high-symbolic" -t 1000
  fi
  ;;
*)
  echo "Usage: $0 {up|down|mute}"
  ;;
esac

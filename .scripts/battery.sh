#!/usr/bin/env bash

while true; do
  battery=$(upower -i "$(upower -e | grep BAT)" | grep percentage | awk '{print$2}' | tr -d '%')
  if [[ battery -le 20 ]]; then
    notify-send -t 10000 "Low battery: ${battery}%" -i "low-battery" -r 6 -u Critical
    sleep 240
  elif [[ battery -ge 80 && battery -lt 100 ]]; then
    notify-send -t 3000 "Battery: ${battery}%" -i "eighty-battery" -r 6
    sleep 1800
  elif [[ battery -eq 100 ]]; then
    notify-send -t 5000 "Battery fully charged!" -i "full-battery" -r 6
    sleep 3600
  else
    sleep 1000
  fi
done

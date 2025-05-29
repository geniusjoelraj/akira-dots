#!/usr/bin/env bash

while true; do
  battery=$(upower -i "$(upower -e | grep BAT)" | grep percentage | awk '{print$2}' | tr -d '%')
  if [[ battery -le 20 ]]; then
    notify-send -t 10000 "Low battery: ${battery}%" -i "low-battery"
    sleep 240
  elif [[ battery -ge 80 && battery -lt 100 ]]; then
    notify-send -t 5000 "Battery: ${battery}%" -i "eighty-battery"
    sleep 24000
  elif [[ battery -eq 100 ]]; then
    notify-send -t 20000 "Battery fully charged!" -i "full-battery"
    sleep 50000
  else
    sleep 120
  fi
done

#!/usr/bin/env bash

while true; do
  state=$(upower -i '/org/freedesktop/UPower/devices/battery_BAT0' | grep state | awk '{print $2}')
  battery=$(upower -i "$(upower -e | grep BAT)" | grep percentage | awk '{print$2}' | tr -d '%')
  if [[ $state == "charging" ]]; then
    echo
  elif [[ battery -eq 30 ]]; then
    notify-send -t 10000 "Low battery:" "${battery}%" -i "low-battery" -r 6 -u Critical
  elif [[ battery -eq 25 ]]; then
    notify-send -t 10000 "Low battery:" "${battery}%" -i "low-battery" -r 6 -u Critical
  elif [[ battery -eq 20 ]]; then
    notify-send -t 10000 "Low battery:" "${battery}%" -i "low-battery" -r 6 -u Critical
  elif [[ battery -eq 15 ]]; then
    notify-send -t 10000 "Low battery:" "${battery}%" -i "low-battery" -r 6 -u Critical
  elif [[ battery -le 10 ]]; then
    echo $battery
    eww open battery
  elif [[ battery -eq 80 ]]; then
    notify-send -t 3000 "Battery:" "${battery}%" -i "eighty-battery" -r 6
  elif [[ battery -eq 85 ]]; then
    notify-send -t 3000 "Battery:" "${battery}%" -i "eighty-battery" -r 6
  elif [[ battery -eq 90 ]]; then
    notify-send -t 3000 "Battery:" "${battery}%" -i "eighty-battery" -r 6
  elif [[ battery -eq 80 ]]; then
    notify-send -t 3000 "Battery" "${battery}%" -i "eighty-battery" -r 6
  elif [[ battery -eq 100 ]]; then
    notify-send -t 5000 "Battery fully charged!" "Battery: ${battery}" -i "full-battery" -r 6
  fi
  sleep 120
done

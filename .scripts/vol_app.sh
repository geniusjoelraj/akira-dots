#!/usr/bin/env bash

app=$1
case $2 in

"up")
  wpctl set-volume $(wpctl status | grep $app | tail -1 | awk '{print $1}' | sed 's/\.//') 5%+
  ;;
"down")
  wpctl set-volume $(wpctl status | grep $app | tail -1 | awk '{print $1}' | sed 's/\.//') 5%-
  ;;
"")
  # wpctl get-volume $(wpctl status | grep $app | tail -1 | awk '{print $1}' | sed 's/\.//')
  echo $(wpctl get-volume $(wpctl status | grep $app | tail -1 | awk '{print $1}' | sed 's/\.//') | awk '{print $2}' | sed 's/\0.//')%
  ;;

esac

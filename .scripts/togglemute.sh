if [[ $(brightnessctl -d platform::micmute get) == 1 ]]; then
  brightnessctl -d platform::micmute set 10-
  wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
else
  brightnessctl -d platform::micmute set +10
  wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
fi

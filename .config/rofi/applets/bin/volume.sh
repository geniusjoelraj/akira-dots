#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Custom Tools Menu (5 Options)

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Current System Info (Can be customized or removed if not needed)
# Example info - replace with whatever you want to display in the message
hostname=$(hostname)
kernel_version=$(uname -r | cut -d'-' -f1)

active=""
urgent=""

# --- ICON AND TEXT CUSTOMIZATION PLACEHOLDERS ---
# You can change the icons (Unicode or Nerd Font) and the accompanying text here.

# Option 1: Full Screenshot
opt1_icon='' # Full Screenshot Icon (Example: Nerd Font fa-solid-camera-retro)
opt1_text='Full Screenshot'

# Option 2: Partial Screenshot
opt2_icon='󰹑' # Partial Screenshot Icon (Example: Nerd Font fa-solid-crop)
opt2_text='Partial Screenshot'

# Option 3: Palette Selector
opt3_icon='' # Color Palette Icon (Example: Nerd Font fa-solid-palette)
opt3_text='Palette Selector'

# Option 4: Power Modes Menu
opt4_icon='' # Power Icon (Example: Nerd Font fa-solid-bolt)
opt4_text='Power Modes'

# Option 5: Settings (e.g., Volume/Network/General Settings)
opt5_icon='' # Settings Icon (Example: Nerd Font fa-solid-sliders)
opt5_text='System Settings'

# --- END CUSTOMIZATION PLACEHOLDERS ---

# Theme Elements
prompt="Tools Menu"
mesg="Host: $hostname, Kernel: $kernel_version" # Adjust this message as desired

# Since we only have 5 options, let's adjust the layout variables.
if [[ "$theme" == *'type-1'* ]]; then
  list_col='1'
  list_row='5'
  win_width='400px'
elif [[ "$theme" == *'type-3'* ]]; then
  list_col='1'
  list_row='5'
  win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
  list_col='1'
  list_row='5'
  win_width='520px'
elif [[ ("$theme" == *'type-2'*) || ("$theme" == *'type-4'*) ]]; then
  list_col='5' # 5 columns
  list_row='1' # 1 row
  win_width='670px'
fi

# Options based on layout preference
layout=$(cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2)
if [[ "$layout" == 'NO' ]]; then
  option_1="$opt1_icon $opt1_text"
  option_2="$opt2_icon $opt2_text"
  option_3="$opt3_icon $opt3_text"
  option_4="$opt4_icon $opt4_text"
  option_5="$opt5_icon $opt5_text"
else
  option_1="$opt1_icon"
  option_2="$opt2_icon"
  option_3="$opt3_icon"
  option_4="$opt4_icon"
  option_5="$opt5_icon"
fi

# Rofi CMD
rofi_cmd() {
  rofi -theme-str "window {width: $win_width;}" \
    -theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str 'textbox-prompt-colon {str: "🛠";}' \
    -dmenu \
    -p "$prompt" \
    -mesg "$mesg" \
    ${active} ${urgent} \
    -markup-rows \
    -theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Execute Command
run_cmd() {
  if [[ "$1" == '--opt1' ]]; then
    # Command for: Full Screenshot
    # TODO: PLACE YOUR FULL SCREENSHOT COMMAND HERE (e.g., 'scrot', 'flameshot full', etc.)
    echo "full screenshot command executed"
  elif [[ "$1" == '--opt2' ]]; then
    # Command for: Partial Screenshot
    # TODO: PLACE YOUR PARTIAL/AREA SCREENSHOT COMMAND HERE (e.g., 'scrot -s', 'flameshot gui', etc.)
    echo "partial screenshot command executed"
  elif [[ "$1" == '--opt3' ]]; then
    # Command for: Palette Selector (Color Picker)
    # TODO: PLACE YOUR COLOR PALETTE/PICKER COMMAND HERE (e.g., 'gpick', 'kcolorchooser', etc.)
    echo "palette selector command executed"
  elif [[ "$1" == '--opt4' ]]; then
    # Command for: Power Modes Menu
    # TODO: PLACE YOUR POWER MODES/POWER MENU COMMAND HERE (e.g., 'sh ~/.config/rofi/powermenu.sh')
    echo "power modes menu command executed"
  elif [[ "$1" == '--opt5' ]]; then
    # Command for: System Settings
    # TODO: PLACE YOUR SYSTEM SETTINGS COMMAND HERE (e.g., 'pavucontrol', 'nm-connection-editor', or 'xfce4-settings-manager')
    echo "system settings command executed"
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1)
  grim - | wl-copy && wl-paste >~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | notify-send "Screenshot of whole screen taken" -t 1000 # screenshot of the whole screen
  ;;
$option_2)
  quickshell -c /home/tensai/dotfiles/.config/quickshell/hyprquickshot -n
  ;;
$option_3)
  /home/tensai/.config/rofi/applets/bin/volume.sh
  ;;
$option_4)
  run_cmd --opt4
  ;;
$option_5)
  run_cmd --opt5
  ;;
esac

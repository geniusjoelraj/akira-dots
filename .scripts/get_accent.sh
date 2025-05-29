colors='rosewater,flamingo,pink,mauve,red,maroon,peach,yellow,green,teal,sky,sapphire,blue,lavender'
declare -A color_dict=(
  [rosewater]="f5e0dc"
  [flamingo]="f2cdcd"
  [pink]="f5c2e7"
  [mauve]="cba6f7"
  [red]="f38ba8"
  [maroon]="eba0ac"
  [peach]="fab387"
  [yellow]="f9e2af"
  [green]="a6e3a1"
  [teal]="94e2d5"
  [sky]="89dceb"
  [sapphire]="74c7ec"
  [blue]="89b4fa"
  [lavender]="b4befe"
)
color=$(echo $colors | rofi -sep ',' -dmenu)
hexcode=${color_dict[$color]}
wl-copy $hexcode

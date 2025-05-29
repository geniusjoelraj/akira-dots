from colorthief import ColorThief
import math
import os


#Palette
hex_palette={
"rosewater":"f5e0dc",
"flamingo":"f2cdcd",
"pink":"f5c2e7",
"mauve":"cba6f7",
"red":"f38ba8",
"maroon":"eba0ac",
"peach":"fab387",
"yellow":"f9e2af",
"green":"a6e3a1",
"teal":"94e2d5",
"sky":"89dceb",
"sapphire":"74c7ec",
"blue":"89b4fa",
"lavender":"b4befe"
}

def to_rgb(hex):
    return tuple(int(hex[i:i+2],16) for  i in (0,2,4))

def rgb_to_hex(rgb):
    return ''.join(f'{c:02x}' for c in rgb)

def print_rgb_block(rgb):
    r,g,b=rgb
    print(f"\033[48;2;{r};{g};{b}m   \033[0m")

def euclidean_distance(c1, c2):
    return math.sqrt(sum((a - b) ** 2 for a, b in zip(c1, c2)))

def map_to_palette(color, palette):
    # color: tuple (R, G, B)
    # palette: list of tuples [(R,G,B), ...]
    closest_color = min(palette, key=lambda c: euclidean_distance(color, c))
    return closest_color

rgb_palette= {to_rgb(v):k for k,v in hex_palette.items()}

wall=open(os.path.expanduser("~/.current_wallpaper")).read().rstrip('\n')
color_thief = ColorThief(wall)
wall_color = color_thief.get_color(quality=1)
palette=map_to_palette(wall_color,rgb_palette.keys())
color=rgb_palette[palette]
print(hex_palette[color])



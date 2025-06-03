#!/usr/bin/env bash

# Wallpaper-Ordner
DIRS=(
  "$HOME/Pictures/Wallpapers"
)

# Bilder sicher auflisten
FILES=$(find "${DIRS[@]}" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \))

# Auswahl per rofi
CHOSEN=$(printf '%s\n' $FILES | rofi -dmenu -p "Wähle Wallpaper")

[ -z "$CHOSEN" ] && exit

# Wallpaper setzen mit swww
swww img "$CHOSEN" --transition-type any --transition-duration 1

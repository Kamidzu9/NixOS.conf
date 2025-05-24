{ config, pkgs, ... }:

{
  home.file.".config/hypr/scripts/random-wallpaper.sh".text = ''
    #!/bin/bash

    LOCKFILE="/tmp/random-wallpaper.lock"
    [ -e "$LOCKFILE" ] && exit 0
    touch "$LOCKFILE"

    # Define the directories
    AESTHETIC_DIR="$HOME/Pictures/Wallpapers/aesthetic-wallpapers/images"
    WALLS_DIR="$HOME/Pictures/Wallpapers/walls"

    # Get all images and gifs from both directories
    IMAGE_FILES=$(find "$AESTHETIC_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \))
    GIF_FILES=$(find "$AESTHETIC_DIR" -type f -iname '*.gif')
    
    # Get all images and gifs from subdirectories inside the "walls" directory
    WALLS_IMAGE_FILES=$(find "$WALLS_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \))
    WALLS_GIF_FILES=$(find "$WALLS_DIR" -type f -iname '*.gif')

    # Combine all files
    ALL_FILES="$IMAGE_FILES"$'\n'"$GIF_FILES"$'\n'"$WALLS_IMAGE_FILES"$'\n'"$WALLS_GIF_FILES"

    # Pick a random wallpaper
    RANDOM_WALLPAPER=$(echo "$ALL_FILES" | shuf -n 1)

    if [ -n "$RANDOM_WALLPAPER" ]; then
      # Use swww to change the wallpaper with a smooth transition
      swww img "$RANDOM_WALLPAPER" --transition-type random --transition-fps 30
    else
      echo "❌ No wallpapers found in $AESTHETIC_DIR or $WALLS_DIR"
    fi

    sleep 1
    rm -f "$LOCKFILE"
  '';
}


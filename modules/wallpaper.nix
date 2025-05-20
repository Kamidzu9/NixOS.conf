{ config, pkgs, ...}:

{
  home.file.".config/hypr/scripts/random-wallpaper.sh".text = ''
    #!/bin/bash

    WALLPAPER_DIR="$HOME/Github/aesthetic-wallpapers/images"
    RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

    if [ -n "$RANDOM_WALLPAPER" ]; then
      hyprctl hyprpaper unload all
      hyprctl hyprpaper preload "$RANDOM_WALLPAPER"
      hyprctl hyprpaper wallpaper "eDP-1,$RANDOM_WALLPAPER"
    else
      echo "❌ No wallpapers found in $WALLPAPER_DIR"
    fi
  '';
}

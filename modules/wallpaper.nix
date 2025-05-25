{
  home.file.".config/hypr/scripts/random-wallpaper.sh".text = ''
    #!/bin/bash

    LOCKFILE="/tmp/random-wallpaper.lock"
    [ -e "$LOCKFILE" ] && exit 0
    touch "$LOCKFILE"

    WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

    # Збираємо всі зображення (включно з gif) з усіх підпапок
    ALL_FILES=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' \))

    # Випадкове зображення
    RANDOM_WALLPAPER=$(echo "$ALL_FILES" | shuf -n 1)

    if [ -n "$RANDOM_WALLPAPER" ]; then
      swww img "$RANDOM_WALLPAPER" --transition-type random --transition-fps 30
    else
      echo "❌ No wallpapers found in $WALLPAPER_DIR"
    fi

    sleep 1
    rm -f "$LOCKFILE"
  '';
}


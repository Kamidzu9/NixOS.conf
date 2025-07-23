#!/usr/bin/env bash

hyprctl dispatch exec '[float; center] kitty --title "Wallpaper Picker" bash -c "
  DIRS=(\"\$HOME/github/walls\")

  FILE=\$(find \${DIRS[@]} -type f \\( -iname \"*.jpg\" -o -iname \"*.png\" -o -iname \"*.gif\" \\) |
    sed \"s|\$HOME/||\" |
    fzf --preview \"chafa \$HOME/{} --size=74x74\" \
        --preview-window=right:60%:wrap \
        --border)

  [[ -z \"\$FILE\" ]] && exit 0

  FILE=\"\$HOME/\$FILE\"
  
  # Set wallpaper with swww
  swww img \"\$FILE\" --transition-type any --transition-duration 1
  
  # Generate and apply pywal colors from chosen wallpaper
  wal -i \"\$FILE\" --saturate 0.8 --backend imagemagick

  read -n 1 -s -r -p \"Drücke eine Taste zum Schließen...\"
"'

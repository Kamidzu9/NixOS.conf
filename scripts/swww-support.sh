#!/bin/bash

echo "➡️ Конвертація .webp у .png..."
find . -type f -name "*.webp" | while read -r f; do
  magick convert "$f" "${f%.webp}.png" && rm "$f"
  echo "✅ $f -> ${f%.webp}.png"
done

echo "➡️ Конвертація .mp4 у .gif..."

shopt -s nullglob
mp4_files=(./walls/animated/*.mp4)

if [ ${#mp4_files[@]} -eq 0 ]; then
  echo "⚠️ Файлів .mp4 в ./walls/animated/ не знайдено"
else
  for f in "${mp4_files[@]}"; do
    base="${f%.mp4}"
    palette="${base}_palette.png"
    gif="${base}.gif"

    echo "🔄 $f -> $gif"

    ffmpeg -i "$f" -vf "fps=15,scale=680:-1:flags=lanczos,palettegen" -y "$palette"
    ffmpeg -i "$f" -i "$palette" -filter_complex "fps=15,scale=680:-1:flags=lanczos[x];[x][1:v]paletteuse" "$gif"

    rm "$palette"
    rm "$f"
    echo "✅ Видалено $f і створено $gif"
  done
fi

echo "🎉 Всі файли оброблені і оригінали видалені."


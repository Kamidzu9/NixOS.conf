#!/bin/bash

echo "➡️ Converting .webp to .png..."
find . -type f -name "*.webp" -exec sh -c 'for f; do convert "$f" "${f%.webp}.png"; done' sh {} +

echo "🧹 Deleting all .webp files..."
find . -type f -name "*.webp" -delete

echo "🎞️ Converting .mp4 to .gif..."
for f in ./walls/animated/*.mp4; do
  gif="${f%.mp4}.gif"
  ffmpeg -i "$f" -vf "fps=15,scale=640:-1:flags=lanczos" -c:v gif "$gif"
done

echo "✅ Done. All wallpapers are ready for swww!"


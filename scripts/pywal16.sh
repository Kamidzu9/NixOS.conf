#!/usr/bin/env bash
declare -A relink=(
    # [ <file name inside ~/.cache/wal/> ]=" <path to link to> "
)

for var in "${!relink[@]}"; do 
    [[ -f "${relink[$var]}" ]] &&  rm ${relink[$var]}
    ln -sf "$HOME/.cache/wal/$var" ${relink[$var]}
done

pkill waybar
hyprctl dispatch exec waybar

swww img $(cat "$HOME/.cache/wal/wal")
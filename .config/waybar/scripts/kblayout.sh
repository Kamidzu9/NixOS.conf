#!/usr/bin/env bash

layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')
case "$layout" in
    German) echo "de" ;;
    Ukrainian) echo "ua" ;;
    *) echo "$layout" ;;
esac

#!/usr/bin/env bash
trap "echo -e '\nProgram interrupted (Ctrl+c)'; wal -R -q; exit" SIGINT

WALLPAPER_DIR=${WALLPAPER_DIR:-"$HOME/Pictures/Wallpaper"} # TODO: change default wallpaper-dir @Kamidzu9  
SCRIPT_DIR=$(dirname $(realpath "${BASH_SOURCE[0]}"))

MIN_CONTRAST=0.0
MAX_CONTRAST=21.0
MIN_SATURATE=0.0
MAX_SATURATE=1.0

saturate=0.5
contrast=2.5
current=""
img=""

[[ -f "$HOME/.cache/wal/wal" ]] &&  current="$(cat "$HOME/.cache/wal/wal")"

error_handler() {
    error_code=""
    if [[ $? -ne 0 ]]; then error_code=" ($?)"; fi
    echo "Error:$error_code $1"
    exit 1
}

next_previous () {
    local files=($WALLPAPER_DIR/*)
    if [[ ${#files[@]} -eq 0 ]]; then
        error_handler "No wallpapers found in $WALLPAPER_DIR"
    fi
    if [[ -z "$current" ]]; then
        error_handler "No current wallpaper set. Please set a wallpaper first."
    fi
    local idx=-1
    for i in "${!files[@]}"; do
        [[ "${files[$i]}" == "$current" ]] && idx=$i && break
    done
    if [[ $idx -ge 0 ]]; then
        if [[ "$1" == "next" ]]; then
            local next_idx=$(( (idx + 1) % ${#files[@]} ))
        else
            local next_idx=$(( (idx - 1 + ${#files[@]}) % ${#files[@]} ))
        fi
        img="${files[$next_idx]}"
    else
        img="${files[0]}"
    fi
}

reload () {
    if [[ -z "$current" ]]; then
        error_handler "No current wallpaper set. Please set a wallpaper first."
    fi
    img="$current"
}

help () {
    cat <<HELP
Usage: $(realpath $0) [OPTION] COMMAND
commands:
    reload                  Reload the current wallpaper
    random                  Set a random wallpaper from the wallpaper directory
    next                    Set the next wallpaper in the wallpaper directory
    previous                Set the previous wallpaper in the wallpaper directory
    /path/to/img            Set the specified image as wallpaper
options:
    -c, --contrast <value>  Set contrast [$MIN_CONTRAST-$MAX_CONTRAST] (default: $contrast)
    -s, --saturate <value>  Set saturation [$MIN_SATURATE-$MAX_SATURATE] (default: $saturate)
    -h, --help              Show this help message
HELP
}


if [[ -z $1 ]]; then
    echo "Usage: $(realpath $0) [OPTION] COMMAND"
    echo
    echo "No arguments provided. Use -h or --help for usage information."
    exit 0
fi

while [[ $# -gt 0 ]]; do
    case "$1" in
        reload)
            reload; shift ;;
        random)
            img="$WALLPAPER_DIR"; shift ;;
        next|previous)
            next_previous $1; shift ;;
        -h|--help)
            help; exit 0 ;;
        -c|--contrast)
            contrast="$2"; shift 2 ;;
        -s|--saturate)
            saturate="$2"; shift 2 ;;
        *)
            if [[ -f "$1" ]]; then
                img="$1"
                shift
            else
                error_handler "Invalid argument: $1. Use -h or --help for usage information."
            fi
        ;;
    esac
done

wal -i $img -n --saturate $saturate --contrast $contrast -o $SCRIPT_DIR/pywal16.sh -q --cols16 

color=0
for i in {1..2}; do
    for j in {0..7}; do
        printf "\e[48;5;${color}m   \e[0m"
        ((color++))
    done
    echo
done
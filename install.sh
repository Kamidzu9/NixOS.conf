#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A defaults=(
    [battGov]="powersave"
    [battTurbo]="never"
    [acGov]="performance"
    [acTurbo]="auto"
    [hostname]="$USER-nixos"
    [user]="$USER"
    [fullName]="$USER"
    [email]="foo@bar.com"
    [luksUUID]=""
)

for var in "${!defaults[@]}"; do
    default="${defaults[$var]}"
    read -p "Enter value for $var (default: '$default'): " input
    eval "$var=\"\${input:-$default}\""
done

echo -e "\nFinal values:\n"
echo "{"  > "$DIR/config/env.nix"
for var in "${!defaults[@]}"; do
    line="$var=\"$(eval "echo \"\$$var\"")\""
    echo "$line"
    echo "    $line;" >> "$DIR/config/env.nix"
done
echo "}" >> "$DIR/config/env.nix"


sudo ln -sf "$DIR/config/configuration.nix" "/etc/nixos/configuration.nix"
sudo nixos-rebuild switch

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    kitty
    zsh
    ffmpeg
    imagemagick
    rofi-wayland
    curl
    cmake
    openjdk
    swww
    networkmanagerapplet
    networkmanager
    iw
    wirelesstools
    xwayland
    waybar
    python314Full
    waypaper
    brightnessctl
    libinput-gestures
    xdotool
    imv
    grim
    slurp
    nixpkgs-fmt
    wl-clipboard
  ];
}


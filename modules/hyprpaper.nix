{ config, pkgs, ... }:

let
  wp = "/home/mischa/Github/personal/aesthetic-wallpapers/images/nix.png";
in {
  home.packages = [ pkgs.hyprpaper ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${wp}
    wallpaper = eDP-1,${wp}
  '';
}

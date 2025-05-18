{ config, pkgs, ... }:

let
  wp = "/home/mischa/Github/aesthetic-wallpapers/images/astronaut.jpg";
in {
  xdg.configFile."/home/mischa/.config/hypr/hyprpaper.conf".text = ''
    preload = ${wp}
    wallpaper = eDP-1,${wp}
  '';

  home.packages = [ pkgs.hyprpaper ];
}

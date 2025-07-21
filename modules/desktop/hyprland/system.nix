{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}

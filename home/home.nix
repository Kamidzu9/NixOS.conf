{
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  imports = [
    # Base-Module
    ../modules/base

    # CLI-Tools
    ../modules/cli

    # Desktop-Programme
    ../modules/desktop/gtk.nix
    ../modules/desktop/hyprland/home.nix
    ../modules/desktop/kitty.nix
    ../modules/desktop/qt.nix
    ../modules/desktop/rofi.nix
    ../modules/desktop/swaylock.nix
    ../modules/desktop/swaync.nix
    ../modules/desktop/waybar.nix
  ];
}

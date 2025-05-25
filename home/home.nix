{
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../modules/fastfetch.nix
    ../modules/git.nix
    ../modules/gtk.nix
    ../modules/hyprland.nix
    ../modules/kitty.nix
    ../modules/mc.nix
    ../modules/mpv.nix
    ../modules/neovim.nix
    ../modules/pkgs.nix
    ../modules/qt.nix
    ../modules/rofi.nix
    ../modules/starship.nix
    ../modules/wallpaper.nix
    ../modules/waybar.nix
    ../modules/zshrc.nix
    ../modules/btop.nix
  ];
}


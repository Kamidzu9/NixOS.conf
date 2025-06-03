{
  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  imports = [
    # Neovim
    ./modules/neovim/default.nix

    # Base-Module
    ../modules/base/git.nix
    ../modules/base/pkgs.nix
    ../modules/base/starship.nix
    ../modules/base/zshrc.nix

    # CLI-Tools
    ../modules/cli/btop.nix
    ../modules/cli/fastfetch.nix
    ../modules/cli/mc.nix
    ../modules/cli/mpv.nix

    # Desktop-Programme
    ../modules/desktop/swaync.nix
    ../modules/desktop/gtk.nix
    ../modules/desktop/hyprland/home.nix
    ../modules/desktop/kitty.nix
    ../modules/desktop/qt.nix
    ../modules/desktop/rofi.nix
    ../modules/desktop/waybar.nix
  ];
}

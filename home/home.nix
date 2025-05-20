{ config, pkgs, ... }:

let
  env = import ../env.nix;
in
{
  # Версія Home Manager, має співпадати з NixOS
  home.stateVersion = "24.11";

  imports = [
    ../modules/hyprland.nix
    ../modules/hyprpaper.nix
    ../modules/wallpaper.nix
    ../modules/waybar.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Пакети, які хочеш мати в $HOME
  home.packages = with pkgs; [
    wget neovim starship git fastfetch adwaita-icon-theme apostrophe google-chrome docker nodejs_23 yazi hyprpaper coreutils findutils libreoffice mc
  ];

  # Налаштування Git
  programs.git = {
    enable    = true;
    userName  = "${env.myFullName}";
    userEmail = "${env.myEmail}";
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
    };
    lfs.enable = true;
    # defaultBranch = "main";
  };

  # Starship
  programs.starship = {
    enable   = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-qt;  # the actual Nix package :contentReference[oaicite:4]{index=4}
      name    = "Adwaita";                # theme name passed to GTK :contentReference[oaicite:5]{index=5}
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      package = pkgs.adwaita-icon-theme;
      name = "adwaita-dark";
    };
  };

  # Коли потрібно підлаштувати dot‑file
  home.file.".zshrc".text = ''
    export HISTFILE="$HOME/.zsh_history"
    HISTSIZE=10000
    SAVEHIST=10000
    bindkey "^[[1;5C" forward-word
    bindkey "^[[1;5D" backward-word
    bindkey "^[[1;5A" up-line-or-history
    bindkey "^[[1;5B" down-line-or-history
    eval "$(starship init zsh)"
  '';
}


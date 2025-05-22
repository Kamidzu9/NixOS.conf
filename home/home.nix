{ config, pkgs, ... }:

let
  env = import ../env.nix;
in
{
  home.stateVersion = "24.11";

  imports = [
    ../modules/mc.nix
    ../modules/hyprland.nix
    ../modules/hyprpaper.nix
    ../modules/wallpaper.nix
    ../modules/waybar.nix
    ../modules/rofi.nix
    ../modules/kitty.nix
    ../modules/fastfetch.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    wget
    neovim 
    starship 
    git 
    fastfetch 
    adwaita-icon-theme 
    google-chrome 
    nodejs_23 
    hyprpaper 
    coreutils 
    findutils 
    libreoffice 
    mc 
    pamixer
    gimp
  ];

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
  };
 
  programs.starship = {
    enable   = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-qt;  
      name    = "Adwaita";   
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


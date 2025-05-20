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
    ../modules/rofi.nix
    ../modules/kitty.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Пакети, які хочеш мати в $HOME
  home.packages = with pkgs; [
    wget neovim starship git fastfetch adwaita-icon-theme apostrophe google-chrome docker nodejs_23 yazi hyprpaper coreutils findutils libreoffice mc pamixer
  ];

  
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passtrough = false;
      gtk-layer-shell = true;
      height = 0;
      modules-left = [
        "hyprland/workspaces"
        "cpu"
        "memory"
      ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "tray"
        "network"
        "backlight"
        "pulseaudio"
	"pulseaudio#microphone"
        "battery"
        "clock"
      ];
      "hyprland/window" = { format = "{}"; };
      "wlr/workspaces" = {
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
        all-outputs = true;
        on-click = "activate";
      };
      battery = { format = "󰁹 {}%"; };
      cpu = {
        interval = 10;
        format = "󰻠 {}% ";
        max-length = 10;
        on-click = "";
      };
      memory = {
        interval = 30;
        format = "  {}% ";
        format-alt = "  {used:0.1f}G ";
        max-length = 10;
      };
      backlight = {
        format = "󰖨 {}";
        device = "acpi_video0";
      };
      tray = {
        icon-size = 13;
        tooltip = false;
        spacing = 10;
      };
      network = {
        format = "󰖩 {essid}";
        format-disconnected = "󰖪 disconnected";
      };
      clock = {
        format = " {:%I:%M %p   %m/%d} ";
        tooltip-format = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>'';
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        tooltip = false;
        format-muted = "";
        on-click = "pamixer -t";
        on-scroll-up = "pamixer -i 5";
        on-scroll-down = "pamixer -d 5";
        scroll-step = 5;
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
      };
      "pulseaudio#microphone" = {
        format = "{format_source}";
        tooltip = false;
        format-source = "󰍬 {volume}%";
        format-source-muted = "󰍭";
        on-click = "pamixer --default-source -t";
        on-scroll-up = "pamixer --default-source -i 5";
        on-scroll-down = "pamixer --default-source -d 5";
        scroll-step = 5;
      };
    }];
    style = builtins.readFile /home/mischa/Github/NixOS.conf/waybar/style.css; # твій CSS
  };

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


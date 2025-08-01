{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passtrough = false;
        gtk-layer-shell = true;
        height = 35;
        spacing = 5;
        margin-top = 5;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "custom/kblayout"
          "backlight"
          "pulseaudio"
          "pulseaudio#microphone"
          "battery"
        ];
        "custom/kblayout" = {
          "exec" = "~/.config/waybar/scripts/kblayout.sh";
          "interval" = 3;
          "tooltip" = false;
        };
        "hyprland/window" = {
          "swap-icon-label" = true;
          "format" = "{}";
          "rewrite" = {
            "(.*) - Google Chrome" = "  $1";
            "(.*)zsh" = " zsh";
          };
          "separate-outputs" = true;
        };
        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "format" = "{icon}";
          "format-icons" = {
            "1" = "󰅨";
            "2" = "󰾔";
            "3" = "󰎇";
            "4" = "";
            "5" = "󱌲";
            "default" = "󰧞";
          };
        };
        battery = {
          format = "{icon} {}%";
          on-click = "notify-send 'Battery Info' \"Remaining time: $(acpi | grep -o '[0-9]*:[0-9]*')\"";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
        backlight = {
          format = "󰖨 {}";
          device = "acpi_video0";
        };
        tray = {
          icon-size = 22;
          tooltip = false;
          spacing = 8;
        };
        clock = {
          format = " {:%I:%M %p   %m/%d}";
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
            default = [
              ""
              ""
              ""
            ];
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
      }
    ];
    style = builtins.readFile ../../.config/waybar/style.css;
  };

  home.file.".config/waybar/scripts/kblayout.sh" = {
    text = builtins.readFile ../../.config/waybar/scripts/kblayout.sh;
    executable = true;
  };

  home.file.".config/hypr/scripts/toggle-waybar.sh" = {
    text = ''
      #!/bin/bash
      PID=$(pgrep waybar)
      if [[ -n "$PID" ]]; then
        kill "$PID"
      else
        waybar &
      fi
    '';
    executable = true;
  };
}

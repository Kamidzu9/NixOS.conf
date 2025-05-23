{
    programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passtrough = false;
      gtk-layer-shell = true;
      height = 4;
      modules-left = [
        "hyprland/workspaces"
	"hyprland/window"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "tray"
        "network"
        "backlight"
        "pulseaudio"
	"pulseaudio#microphone"
        "battery"
      ];
      "hyprland/window" = { format = "{}"; };
      "wlr/workspaces" = {
        on-scroll-up = "hyprctl dispatch workspace e+1";
        on-scroll-down = "hyprctl dispatch workspace e-1";
        all-outputs = true;
        on-click = "activate";
      };
      battery = {
        format = "{icon} {}%";
        on-click = "notify-send 'Battery Info' \"Remaining time: $(acpi | grep -o '[0-9]*:[0-9]*')\"";
        format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ]; 
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
    style = builtins.readFile ../.config/waybar/style.css;
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


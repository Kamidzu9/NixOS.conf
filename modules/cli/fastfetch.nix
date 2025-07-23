{ pkgs, ... }:
let 
  env = import ../../config/env.nix;
  osAge = ''birth_install=$(stat -c %W /); 
current=$(date +%s); 
time_progression=$((current - birth_install)); 
days_difference=$((time_progression / 86400)); 
echo "$days_difference days";'';
in
{

  programs.fastfetch = {

    enable = true;
    package = pkgs.fastfetch;

    settings = {

      display = {
        separator = " ";
        # key.paddingLeft = 3;
        size.binaryPrefix = "si";
      };

      logo = {
        source = "${env.dotfileDir}/assets/nix-cat.png";
        height = 9;
        padding = {
          left = 1;
        };
      };

      modules = [
        "break"
        {
          key = " ";
          type = "os";
          keyColor = "blue";
          format = "{3}";
        }

        {
          key = "󰌽 ";
          type = "kernel";
          keyColor = "yellow";
          format = "{1} {2} ({4})";
        }

        {
          key = "󰅐 ";
          type = "uptime";
          keyColor = "green";
        }

        {
          key = " ";
          type = "memory";
          keyColor = "white";
        }

        # {
        #   key = " ";
        #   keyColor = "blue";
        #   type = "btrfs";
        #   # format = "{1} / {2} ({3})";
        # }

        {
          key = " ";
          type = "packages";
          keyColor = "red";
        }

        {
          key = " ";
          type = "wm";
          keyColor = "cyan";
        }

        {
          type = "command";
          key = "󱦟 ";
          text = osAge;
        }

        {
          key = " ";
          type = "colors";
          keyColor = "magenta";
          symbol = "circle";
        }
      ];
    };
  };
}

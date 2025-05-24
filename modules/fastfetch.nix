{ pkgs, ... }:

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
        preserveAspectRatio = true;
        source = "~/github/personal/NixOS.conf/assets/nix-cat.png";
        type = "kitty";
        height = 9;
        padding.left = 1;
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
	   text = "sh ~/.config/fastfetch/os_age.sh";
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

  home.file.".config/fastfetch/os_age.sh".text = builtins.readFile ../.config/fastfetch/os_age.sh;
}

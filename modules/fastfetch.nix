{ ... }:

{ 
  home.file.".config/fastfetch/config.jsonc".text = builtins.readFile ../.config/fastfetch/fastfetch.jsonc;
  home.file.".config/fastfetch/os_age.sh".text = builtins.readFile ../.config/fastfetch/os_age.sh;
}

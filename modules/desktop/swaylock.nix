{
  programs.swaylock.enable = true;
  home.file.".config/swaylock/config".text = builtins.readFile ../../.config/swaylock/config;
}

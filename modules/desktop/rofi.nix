{ ... }: {

  home.file.".config/rofi/config.rasi".text =
    builtins.readFile ../../.config/rofi/config.rasi;
  home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".text =
    builtins.readFile ../../.config/rofi/catppuccin-mocha.rasi;
}

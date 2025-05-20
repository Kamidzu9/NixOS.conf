{ config, pkgs, ... }: {
programs.kitty = {
  enable = true;
  extraConfig = ''
    font_family FiraCode Nerd Font
    font_size 12

    cursor_shape block
    enable_audio_bell no

    background_opacity 0.78

    map ctrl+shift+n new_os_window
  '';
};
}

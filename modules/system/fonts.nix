{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      ubuntu_font_family
      liberation_ttf
      fira-code
      fira-mono
      fira-sans
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      jetbrains-mono
      vazir-fonts
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Liberation Serif" "Vazirmatn" ];
        sansSerif = [ "Ubuntu" "Vazirmatn" ];
        monospace = [ "Ubuntu Mono" ];
      };
    };
  };
}

{ pkgs, ... }:

{
  qt = {
    enable = true;

    platformTheme.name = "adwaita";

    style.name = "adwaita-dark";
  };

  xdg.configFile = {
    "qt5ct/qt5ct.conf".text = ''
      [Appearance]
      style=adwaita-dark

      [Fonts]
      fixedFont=Monospace
      font=Sans 10

      [Icon Themes]
      icon_theme=Adwaita
    '';
  };
}

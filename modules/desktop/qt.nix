{ pkgs, lib, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "qt5ct/qt5ct.conf".text = lib.generators.toINI { } {
      Appearance = {
        icon_theme = "Papirus-Dark";
        style = "kvantum";
      };
      Fonts = {
        fixed = "RecMonoLinear Nerd Font,10";
        general = "Recursive Sans Linear Static,10";
      };
    };

    "qt6ct/qt6ct.conf".text = lib.generators.toINI { } {
      Appearance = {
        icon_theme = "Papirus-Dark";
        style = "kvantum";
      };
      Fonts = {
        fixed = "RecMonoLinear Nerd Font,10";
        general = "Recursive Sans Linear Static,10";
      };
    };
  };
}

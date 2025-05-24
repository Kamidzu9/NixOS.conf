{ pkgs, ...}:

{
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      package = pkgs.adwaita-icon-theme;
      name = "adwaita-dark";
    };
  };
}

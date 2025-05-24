{ pkgs, ...}:

{
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-qt;  
      name    = "Adwaita";   
      };
  };
}

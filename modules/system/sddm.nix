{ pkgs, ... }:

{

  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "9";
      background = ../../assets/a_mountain_with_trees_and_moon.jpg;
      loginBackground = true;
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };
}

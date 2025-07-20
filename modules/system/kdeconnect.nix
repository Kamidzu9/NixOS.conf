{ }:
let
  env = import ../../config/env.nix;
in
{
  home-manager.users.${env.user}.programs.gnome-shell = {
    enable = true;
    indicator = true;
    extensions = [ { package = pkgs.gnomeExtensions.gsconnect; } ];
    devices = {
      enable = true;
      autoConnect = true;
    };
  };
}

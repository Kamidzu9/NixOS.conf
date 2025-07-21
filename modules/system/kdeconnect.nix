{ }:
let
  env = import ../../config/env.nix;
in
{
  home-manager.users.${env.user}.services.kdeconnect = {
    enable = true;
  };
}

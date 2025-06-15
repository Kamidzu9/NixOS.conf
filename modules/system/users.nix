{ config, pkgs, ... }:
let
  env = import ../../config/env.nix;
in
{
  users.users = {
    # dynamisch aus dem env
    ${env.user} = {
      isNormalUser = true;
      description = env.fullName;
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
  };
}

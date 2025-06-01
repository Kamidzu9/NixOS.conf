{ config, pkgs, ... }:
let
  env = import ../../config/env.nix;
in
{
  users.users = {
    # dynamisch aus dem env
    ${env.myUser} = {
      isNormalUser = true;
      description = env.myFullName;
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };
  };
}

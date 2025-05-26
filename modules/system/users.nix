{ config, pkgs, ... }:
let
  # Pfad von hier aus gesehen: modules/system/users.nix → ../.. → env.nix
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

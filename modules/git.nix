{ ... }:

let
  env = import ../config/env.nix;
in
{
  programs.git = {
    enable = true;
    userName = "${env.myFullName}";
    userEmail = "${env.myEmail}";
    aliases = {
      co = "checkout";
      ci = "commit";
      st = "status";
    };
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

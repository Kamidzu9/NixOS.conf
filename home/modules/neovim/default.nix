{
  pkgs,
  config,
  lib,
  ...
}:

let
  nixvim = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/nixvim/archive/master.tar.gz";
      sha256 = "0hri2rhfg09rrisz1czkdsayi3qrz7pqwmc0rjlz0vn33ddzg5w0";
    }
  );
in
{
  imports = [
    # Module Home-Mager
    nixvim.homeModules.nixvim

    # import
    ./autocommands.nix
    ./completion.nix
    ./keymappings.nix
    ./options.nix
    ./plugins
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "neorg"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };

    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;
  };
}

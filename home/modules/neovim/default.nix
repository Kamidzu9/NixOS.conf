{ pkgs, config, lib, ... }:

let
  nixvim = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/nixvim/archive/master.tar.gz";
    sha256 = "15xs42pgvl1vx5ldgzdwjly4im2bcq9vwghvb054i0wxk4n90adq";
  });
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
    enable                   = true;
    defaultEditor            = true;
    nixpkgs.useGlobalPackages = true;

    performance = {
      combinePlugins = {
        enable            = true;
        standalonePlugins = [
          "hmts.nvim"
          "neorg"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };

    viAlias        = true;
    vimAlias       = true;
    luaLoader.enable = true;
  };
}

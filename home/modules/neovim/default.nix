{ pkgs, config, lib, ... }:

let
  nixvim = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/nixvim/archive/master.tar.gz";
    sha256 = "0y2rwr953sn0xxr05a2j6qyswhys5gs88gady4g1lr1bybjcfx8j";
  });
in
{
  imports = [
    # модуль nixvim для Home-Manager
    nixvim.homeModules.nixvim

    # твої дрібні файли
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

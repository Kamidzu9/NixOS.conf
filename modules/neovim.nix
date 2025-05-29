{ config, pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      catppuccin-nvim
    ];
  };

  home.file.".config/nvim" = {
  source    = ../.config/nvim;
  recursive = true;
};
}


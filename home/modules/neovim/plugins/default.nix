{
  imports = [
    ./barbar.nix
    ./comment.nix
    ./floaterm.nix
    ./harpoon.nix
    ./lsp.nix
    ./lualine.nix
    ./markdown-preview.nix
    ./neorg.nix
    ./neo-tree.nix
    ./snacks.nix # TODO remove
    ./startify.nix
    ./telescope.nix
    ./treesitter.nix
    ./vimtex.nix # inria
  ];

  programs.nixvim = {
    colorschemes.catppuccin.enable = true;

    plugins = {
      # Lazy loading
      lz-n.enable = true;

      web-devicons.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      colorizer = {
        enable = true;
        settings.user_default_options.names = false;
      };

      oil = {
        enable = true;
        lazyLoad.settings.cmd = "Oil";
      };

      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "neo-tree"
            "TelescopePrompt"
          ];
        };
      };

      conform-nvim = {
        enable = true;

        settings = {
          format_on_Save = {
            lspFallback = true;
            timeoutMs = 500;
          };

          formatters_by_ft = {
            lua = [ "stylua" ];
            nix = [ "nixfmt" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            markdown = [ "prettier" ];
            json = [ "prettier" ];
            rust = [ "rustfmt" ];
          };
        };
      };

    };

  };
}

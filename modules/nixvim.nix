{ pkgs, ...}:

{
  programs.nixvim = {
    enable         = true;
    neovimPackage  = pkgs.neovim;
    configDir      = ".config/nvim";

    colorschemes.catppuccin.enable = true;

    # плагіни, LSP, Treesitter, автокомпліт
    extraConfig = ''
      require("nixvim").setup({
        plugins = {
          "nvim-telescope/telescope.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
          "neovim/nvim-lspconfig",
          "hrsh7th/nvim-cmp",
          "hrsh7th/cmp-nvim-lsp",
          "nvim-lualine/lualine.nvim",
          "kyazdani42/nvim-tree.lua",
        },
        lsp = {
          servers = { "pyright", "tsserver", "bashls" },
          format_on_save = true,
        },
        treesitter = {
          ensure_installed = { "lua", "python", "javascript", "bash" },
          highlight = { enable = true },
        },
        cmp = { enable = true },
      })
    '';

    # утиліти для fuzzy-finder та LSP
    extraPackages = with pkgs; [
      ripgrep
      fd
      gcc      # якщо будеш ставити clangd/ccls
    ];
  };
}

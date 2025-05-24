{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      telescope-nvim
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      luasnip
      lualine-nvim
      vim-commentary
      vim-markdown
    ];

    extraPackages = with pkgs; [
      python3
      nodejs
      ripgrep
      fd
      black
      prettierd
      lua-language-server
      pyright
    ];
    extraConfig = ''
  set number
  syntax on
  filetype plugin indent on

  lua << EOF
    require("lualine").setup()
    require("nvim-treesitter.configs").setup {
      highlight = { enable = true },
    }
    require("telescope").setup {}
    require("lspconfig").pyright.setup {}
    require("lspconfig").lua_ls.setup {}

    local cmp = require("cmp")
    cmp.setup {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    }
  EOF
'';
   };
}

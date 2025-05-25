{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      nvim-treesitter
      telescope-nvim
      nvim-lspconfig
      cmp-nvim-lsp
      nvim-cmp
      luasnip
      lualine-nvim
      vim-commentary
      vim-markdown
      catppuccin-nvim
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
      nixd
    ];

    extraConfig = ''
      set number
      set relativenumber
      syntax on
      filetype plugin indent on

      lua << EOF
        local api = vim.api
        local fn  = vim.fn

        require("catppuccin").setup({ flavour = "mocha" })
        vim.cmd("colorscheme catppuccin")

        -- Statusline & Treesitter
        require("lualine").setup()
        require("nvim-treesitter.configs").setup {
          highlight = { enable = true },
        }

        -- Telescope
        require("telescope").setup {}

        -- LSP Servers
        require("lspconfig").pyright.setup {}
        require("lspconfig").lua_ls.setup {}
        require("lspconfig").nixd.setup {}

        -- Completion
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

        -- Helper: run formatter on the whole buffer and restore cursor/view
        local function fmt(cmd)
          local view = fn.winsaveview()
          api.nvim_command('%!' .. cmd)
          fn.winrestview(view)
        end

        -- Auto-format on save group
        local aug = api.nvim_create_augroup("AutoFormat", { clear = true })

        -- Nix
        api.nvim_create_autocmd("BufWritePre", {
          group   = aug,
          pattern = "*.nix",
          callback = function() fmt("nixpkgs-fmt") end,
        })

        -- Python
        api.nvim_create_autocmd("BufWritePre", {
          group   = aug,
          pattern = "*.py",
          callback = function() fmt("black --quiet -") end,
        })

        -- JavaScript / TypeScript / Vue
        api.nvim_create_autocmd("BufWritePre", {
          group   = aug,
          pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.vue" },
          callback = function()
            local fname = fn.expand("%:p")
            fmt("prettierd --stdin-filepath " .. fname)
          end,
        })
      EOF
    '';
  };
}


{
  programs.nixvim.autoCmd = [
    # Vertically center document when entering insert mode
    {
      event = "InsertEnter";
      command = "norm zz";
    }

    # Open help in a vertical split
    {
      event = "FileType";
      pattern = "help";
      command = "wincmd L";
    }

    # Enable spellcheck for some filetypes
    {
      event = "FileType";
      pattern = [
        "tex"
        "latex"
        "markdown"
      ];
      command = "setlocal spell spelllang=en";
    }

    {
      event = "TextYankPost";
      command = "silent! TSBufDisable highlight";
    }

    # Use conform.nvim for formatting on save
    {
      event = "BufWritePre";
      pattern = "*";
      command = "lua require('conform').format({ bufnr = vim.fn.bufnr() })";
    }
  ];
}

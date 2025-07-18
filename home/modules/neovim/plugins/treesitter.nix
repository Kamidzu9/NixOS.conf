{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        ensure_installed = [
          "lua"
          "vim"
          "nix"
          "markdown"
          "latex"
          "javascript"
          "rust"
        ];
        highlight = {
          enable = true;
          disable = [ "nix" ];
        };

        indent.enable = true;
      };
      folding = true;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;
  };
}

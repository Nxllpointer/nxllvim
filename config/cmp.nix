{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
        ];

        window = {
          completion = {
            scrolloff = 3;
          };
        };

        sorting.comparators = [
          "cmp.config.compare.sort_text" # This is how rust_analyzer provides completion score
        ];

        experimental.ghost_text = true;
      };
    };
    cmp-nvim-lsp.enable = true;
  };
}


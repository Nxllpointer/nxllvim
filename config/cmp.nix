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
          "cmp.config.compare.score"
          "cmp.config.compare.kind"
        ];

        preselect = "cmp.PreselectMode.None";

        experimental.ghost_text = true;
      };
    };
    cmp-nvim-lsp.enable = true;
  };
}


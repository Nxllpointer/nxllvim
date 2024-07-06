{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
        ];
      };
    };
    cmp-nvim-lsp.enable = true;
  };
}


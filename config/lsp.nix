{
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        rust-analyzer = {
          enable = true;

          # Use provided rust
          installCargo = false;
          installRustc = false;
        };
        nixd.enable = true;
      };
    };
  };
}

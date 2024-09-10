{ pkgs, ... }: {
  imports = [
    ./mappings.nix
    ./clipboard.nix
    ./autochecktime.nix
    ./indent.nix
    ./autopairs.nix
    ./delimiters.nix
    ./theme.nix
    ./fidget.nix
    ./nix-develop
    ./autosave.nix
    ./statusline.nix
    ./bufferline.nix
    ./telescope.nix
    ./tree.nix
    ./treesitter.nix
    ./lsp.nix
    ./cmp.nix
    ./diagnostics.nix
    ./git.nix
  ];

  _module.args = {
    luaFn = body: { __raw = "function() ${body} end"; };
  };

  enableMan = false; # This significantly improves build times
  withRuby = false;

  extraPackages = with pkgs; [ ripgrep ];

  opts = {
    wrap = false;
    number = true;
    relativenumber = true;
    mousemodel = "extend";
    scrolloff = 8;
    ignorecase = true;
  };
}

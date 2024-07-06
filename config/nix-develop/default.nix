{ pkgs, ... }:
{
  plugins.nix-develop = {
    enable = true;
    package = pkgs.vimPlugins.nix-develop-nvim.overrideAttrs {
      patches = [ ./update-PATH.diff ];
    };
  };
}

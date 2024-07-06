{
  opts = {
    shiftwidth = 4;
    softtabstop = -1; # Follow shiftwidth
    expandtab = true;
    smartindent = true;
    smarttab = true;
  };

  plugins = {
    indent-blankline = {
      enable = true;
      settings = {
        indent.char = "";
        whitespace = {
          highlight = [ "CursorColumn" "Whitespace" ];
          remove_blankline_trail = false;
        };
      };
    };

    intellitab.enable = true;
  };
}

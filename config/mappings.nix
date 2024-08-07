{ luaFn, ... }:
{
  opts = {
    timeout = true;
    timeoutlen = 0;
  };

  globals.mapleader = " ";

  keymaps = [
    {
      mode = [ "" "i" ];
      key = "<C-s>";
      action.__raw = "vim.cmd.w";
      options.desc = "Save File";
    }
    {
      mode = [ "" "i" ];
      key = "<C-S-s>";
      action.__raw = "vim.cmd.wa";
      options.desc = "Save All Files";
    }
    {
      mode = [ "" "i" ];
      key = "<C-q>";
      action = luaFn "vim.lsp.buf.hover(); vim.lsp.buf.hover()";
      options.desc = "Hover";
    }
    {
      mode = "n";
      key = "<Leader>t";
      action.__raw = "vim.cmd.Telescope";
      options.desc = "Open Telescope";
    }
    {
      mode = "n";
      key = "<Leader><Leader>";
      action = luaFn ''vim.cmd.Telescope("find_files")'';
      options.desc = "Find File";
    }
    {
      mode = "n";
      key = "<Leader>b";
      action = luaFn ''vim.cmd.Telescope("buffers")'';
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<Leader><Tab>";
      action = luaFn ''vim.cmd.CHADopen("--always-focus")'';
      options.desc = "Open/Focus File-Tree";
    }
    {
      mode = "";
      key = "<Leader>ca";
      action.__raw = "vim.lsp.buf.code_action";
      options.desc = "Code Action";
    }
    {
      mode = "n";
      key = "<Leader>csr";
      action.__raw = "vim.lsp.buf.rename";
      options.desc = "Rename";
    }
    {
      mode = "n";
      key = "<Leader>csD";
      action = luaFn ''vim.cmd.Telescope("lsp_definitions")'';
      options.desc = "Definitions";
    }
    {
      mode = "n";
      key = "<Leader>csd";
      action.__raw = "vim.lsp.buf.declaration";
      options.desc = "Declaration";
    }
    {
      mode = "n";
      key = "<Leader>csi";
      action = luaFn ''vim.cmd.Telescope("lsp_implementations")'';
      options.desc = "Implementations";
    }
    {
      mode = "n";
      key = "<Leader>csc";
      action= luaFn ''vim.cmd.Telescope("lsp_incoming_calls")'';
      options.desc = "Incoming Calls";
    }
    {
      mode = "n";
      key = "<Leader>csC";
      action= luaFn ''vim.cmd.Telescope("lsp_outgoing_calls")'';
      options.desc = "Outgoing Calls";
    }
    {
      mode = "n";
      key = "<Leader>cst";
      action= luaFn ''vim.cmd.Telescope("lsp_type_definitions")'';
      options.desc = "Type";
    }
    {
      mode = "n";
      key = "<Leader>csT";
      action.__raw = "vim.lsp.buf.typehierarchy";
      options.desc = "Type-Hierarchy";
    }
    {
      mode = "n";
      key = "<Leader>csR";
      action= luaFn ''vim.cmd.Telescope("lsp_references")'';
      options.desc = "References";
    }
    {
      mode = "";
      key = "<Leader>cf";
      action.__raw = "vim.lsp.buf.format";
      options.desc = "Format Code";
    }
    {
      mode = "n";
      key = "<Leader>cd";
      action = luaFn ''vim.cmd.Telescope { "diagnostics", "initial_mode=normal" }'';
      options.desc = "Show Diagnostics";
    }
    {
      mode = "n";
      key = "<Leader>cD";
      action = luaFn "vim.diagnostic.toggle_mode()";
      options.desc = "Change Diagnostics Mode";
    }
    {
      mode = "t";
      key = "<C- >";
      action.__raw = "vim.cmd.stopinsert";
      options.desc = "Exit Terminal Mode";
    }
    # Intellitab
    {
      mode = "i";
      key = "<Tab>";
      action.__raw = ''require("intellitab").indent'';
    }
    # Snippets
    rec {
      mode = ["s" "i"];
      key = "<Tab>";
      action = luaFn /* lua */ ''
        if not vim.snippet.active() then return "${key}" end
        vim.snippet.jump(1)
      '';
      options.expr = true;
    }
    rec {
      mode = ["s" "i"];
      key = "<S-Tab>";
      action = luaFn /* lua */ ''
        if not vim.snippet.active() then return "${key}" end
        vim.snippet.jump(-1)
      '';
      options.expr = true;
    }
  ];

  plugins.cmp.settings.mapping = {
    "<C-Space>" = "cmp.mapping.complete()";
    "<Up>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
    "<Down>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
    "<C-f>" = "cmp.mapping.scroll_docs(4)";
    "<C-b>" = "cmp.mapping.scroll_docs(-4)";
    "<C-e>" = "cmp.mapping.abort()";
    "<CR>" = "cmp.mapping.confirm({ select = true })";
    "<C-q>" = /* lua */ ''
      function()
        if not cmp.visible_docs() then
            cmp.open_docs()
        else
            cmp.close_docs()
        end
      end
    '';
  };

  plugins.which-key = {
    enable = true;
    registrations = {
      "<Leader>c" = { name = "Code"; };
      "<Leader>cs" = { name = "Symbol"; };
    };
  };

}

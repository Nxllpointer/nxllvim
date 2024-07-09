{ luaFn, ... }:
{
  opts = {
    timeout = true;
    timeoutlen = 0;
  };

  globals.mapleader = " ";

  keymaps = [
    {
      mode = [ "n" "i" ];
      key = "<C-s>";
      action.__raw = "vim.cmd.w";
      options.desc = "Save File";
    }
    {
      mode = [ "n" "i" ];
      key = "<C-S-s>";
      action.__raw = "vim.cmd.wa";
      options.desc = "Save All Files";
    }
    {
      mode = [ "n" "i" ];
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
      mode = "n";
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
      key = "<Leader>csd";
      action.__raw = "vim.lsp.buf.definition";
      options.desc = "Go To Definition";
    }
    {
      mode = "n";
      key = "<Leader>csD";
      action.__raw = "vim.lsp.buf.declaration";
      options.desc = "Go To Declaration";
    }
    {
      mode = "n";
      key = "<Leader>csi";
      action.__raw = "vim.lsp.buf.implementation";
      options.desc = "List Implementations";
    }
    {
      mode = "n";
      key = "<Leader>csc";
      action.__raw = "vim.lsp.buf.incoming_calls";
      options.desc = "List Incoming Calls";
    }
    {
      mode = "n";
      key = "<Leader>csC";
      action.__raw = "vim.lsp.buf.outgoing_calls";
      options.desc = "List Outgoing Calls";
    }
    {
      mode = "n";
      key = "<Leader>cst";
      action.__raw = "vim.lsp.buf.typehierarchy";
      options.desc = "Show Type-Hierarchy";
    }
    {
      mode = "n";
      key = "<Leader>csR";
      action.__raw = "vim.lsp.buf.references";
      options.desc = "Show References";
    }
    {
      mode = "n";
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
    {
      mode = "i";
      key = "<Tab>";
      action.__raw = ''require("intellitab").indent'';
    }
  ];

  plugins.cmp.settings.mapping = {
    "<C-Space>" = "cmp.mapping.complete()";
    "<Up>" = "cmp.mapping.select_prev_item()";
    "<Down>" = "cmp.mapping.select_next_item()";
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

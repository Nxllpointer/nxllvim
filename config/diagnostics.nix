{ pkgs, luaFn, ... }:
{
  diagnostics = {
    virtual_text = true;
    virtual_lines = false;
    signs = false;
    underline = true;
  };

  extraPlugins = [ pkgs.vimPlugins.lsp_lines-nvim ];

  extraConfigLua = /* lua */ ''
    do -- Diagnostics mode toggle
      require("lsp_lines").setup()

      vim.diagnostic.toggle_mode = function()
        local cfg = vim.diagnostic.config()
        
        if cfg.virtual_text == true and cfg.virtual_lines == false then
          cfg.virtual_text = false
          cfg.virtual_lines = true
        elseif cfg.virtual_text == false and cfg.virtual_lines == true then
          cfg.virtual_text = false;
          cfg.virtual_lines = false;
        else
          cfg.virtual_text = true;
          cfg.virtual_lines = false;
        end
        
        vim.diagnostic.config(cfg)
      end
    end
  '';

  autoCmd = [
    {
      event = "InsertEnter";
      callback = luaFn "vim.diagnostic.hide()";
    }
    {
      event = "InsertLeave";
      callback = luaFn "vim.diagnostic.show()";
    }
  ];
}

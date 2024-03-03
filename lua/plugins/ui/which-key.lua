-- Show possible keybinds

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        local which_key = require("which-key")
        which_key.setup(opts)

        for _, config in ipairs(require("keymap")) do
            which_key.register(config.mappings, config.opts)
        end

        vim.o.timeout = true
        vim.o.timeoutlen = 0
    end,
}

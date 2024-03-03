vim.g.mapleader = " "

--[[
which-key mappings
https://github.com/folke/which-kGey.nvim#-setup

Entry:
    {
        mappings = {...},
        opts = {...} / nil -- Set to nil/remove to use default options
    },
--]]
return {
    {
        mappings = {
            ["<Leader>"] = {
                ["<Tab>"] = { "<cmd>Neotree action=focus<cr>", "Open/Focus Neotree" },
                c = {
                    name = "Code",
                    h = { vim.lsp.buf.hover, "Hover" },
                    r = { vim.lsp.buf.rename, "Rename" },
                    a = { vim.lsp.buf.code_action, "Code Action" },
                    d = { vim.lsp.buf.definition, "Go to definiton" },
                    f = { vim.lsp.buf.format, "Format" },
                    b = { vim.lsp.buf.references, "References" },
                    i = { vim.diagnostic.open_float, "Diagnistics info" },
                },
            },
        },
        opts = nil,
    },
    {
        mappings = {
            ["<A-Left>"] = { vim.cmd.BufferLineCyclePrev, "Prevoius buffer" },
            ["<A-Right>"] = { vim.cmd.BufferLineCycleNext, "Next buffer" },
        },
        opts = {
            mode = {"n", "i"}
        }
    }
}

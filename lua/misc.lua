-- Indentation
local indent_spaces = 4
vim.o.tabstop = indent_spaces
vim.o.shiftwidth = indent_spaces
vim.o.softtabstop = indent_spaces
vim.o.expandtab = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

vim.diagnostic.config({
    update_in_insert = true,
    signs = false,
})

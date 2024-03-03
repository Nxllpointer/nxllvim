-- Syntax highlighting

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = { "lua", "rust" },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = false,
    },
    config = true,
}

-- Configure LSPs

return {
    "neovim/nvim-lspconfig",
    main = "lspconfig",
    dependencies = {
        { "folke/neodev.nvim" },
    },
    config = false,
}

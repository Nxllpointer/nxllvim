-- Require installation of LSPs and setup LSPs

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "rust_analyzer" },
        })

        -- Setup all installed LSPs
        mason_lspconfig.setup_handlers({
            -- Default handler
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                })
            end,
        })
    end,
}

-- lua/plugins/lsp.lua
return {
    -- Main LSP configuration plugin
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "j-hui/fidget.nvim", opts = {} },
            "saghen/blink.cmp",
        },
        config = function()
            -- We require the on_attach function from our separate config file
            local on_attach = require("plugins.lsp.config").on_attach

            -- Get the enhanced capabilities from blink.cmp
            local original_capabilities = vim.lsp.protocol.make_client_capabilities()
            local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

            -- Central handler to attach our config to each LSP server
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            on_attach = on_attach,
                            capabilities = capabilities,
                        })
                    end,
                },
            })
        end,
    },

    -- Import your other modular LSP plugin configurations
    { import = "plugins.lsp.mason" },
    { import = "plugins.lsp.formatting" },
    { import = "plugins.lsp.linting" },
}

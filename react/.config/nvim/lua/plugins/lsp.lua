return {
    -- Main LSP configuration plugin
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "j-hui/fidget.nvim", opts = {} },
        },
        config = function()
            -- This is the crucial part: we use a standard 'require' to load the on_attach function
            -- from your separate config file.
            local on_attach = require("plugins.lsp.config").on_attach

            -- Set up mason and mason-lspconfig to automatically install and manage servers.
            -- This ensures that the on_attach function is used for all servers.
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            on_attach = on_attach,
                        })
                    end,
                },
            })
        end,
    },

    -- Import your other modular LSP plugin configurations
    { import = 'plugins.lsp.mason' },
    { import = 'plugins.lsp.formatting' },
    { import = 'plugins.lsp.linting' },
}

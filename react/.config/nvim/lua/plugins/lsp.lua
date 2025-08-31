-- lua/plugins/lsp.lua

return {
    -- Import the other LSP-related configurations
    -- The order matters here. We want to ensure mason is set up before lspconfig.
    { import = 'plugins.lsp.mason' },
    { import = 'plugins.lsp.config' },
    { import = 'plugins.lsp.formatting' },
    { import = 'plugins.lsp.linting' },
}

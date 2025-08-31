-- lua/plugins/lsp/mason.lua

return {
    -- LSP package management
    {
        "williamboman/mason.nvim",
        opts = {
            -- Default settings for Mason
            ui = {
                border = "rounded",
                width = 0.8,
                height = 0.8,
            },
        },
    },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- This is a separate plugin that integrates with mason.nvim
    -- It's responsible for actually installing the tools.
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            -- A list of all tools to ensure are installed.
            -- These are automatically installed by mason-tool-installer
            ensure_installed = {
                -- LSP Servers
                "lua_ls",
                "typescript-language-server", -- For TypeScript/JavaScript
                "css-lsp",        -- For CSS
                "html-lsp",       -- For HTML
                "json-lsp",       -- For JSON

                -- Linters
                "eslint_d", -- For JavaScript/TypeScript linting

                -- Formatters
                "prettierd", -- For formatting most web files			
            },
        },
    },
}

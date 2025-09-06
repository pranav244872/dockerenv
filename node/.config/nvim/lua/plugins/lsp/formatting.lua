-- lua/plugins/lsp/formatting.lua

return {
    "stevearc/conform.nvim",
    opts = {
        -- A map of filetypes to the formatters to use.
        -- The formatters are installed via Mason in mason.lua
        formatters_by_ft = {
            lua = { "stylua" },

            -- Use Prettier for all web-related filetypes
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            json = { "prettierd" },
            css = { "prettierd" },
            html = { "prettierd" },
            markdown = { "prettierd" },
        },

        -- This is the key part: enabling format on save.
        -- It's built-in, so no need for a custom autocommand.
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            -- If you want to fallback to LSP formatting if conform fails
            lsp_fallback = true,
        },
    },
}

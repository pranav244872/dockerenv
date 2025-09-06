return {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
        local lint = require("lint")

        -- Configure nvim-lint to use eslint_d for JavaScript and TypeScript files.
        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
        }

        -- Create an autocommand to run the linter on save and when you open a file.
        local lint_augroup = vim.api.nvim_create_augroup("linting", { clear = true })
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}

return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({
            winopts = {
                -- winopts will be passed to the floating window
                -- Bortheight = 0.8,
                height = 0.8,
                width = 0.8,
            },
            keymap = {
                -- These are the default keymaps. You can customize them
                -- or configure them in the setup if you don't like the defaults.
                ["fzf-in"] = {
                    -- CTRL-X opens in a vertical split
                    ["<C-x>"] = "split",
                    -- CTRL-V opens in a vertical split
                    ["<C-v>"] = "vsplit",
                    -- CTRL-T opens in a new tab
                    ["<C-t>"] = "tabnew",
                },
            },
            fzf_opts = {
                -- These are the options passed to the fzf command.
                -- See `man fzf` for more options.
                ['--info'] = 'inline',
                ['--height'] = '80%',
                ['--layout'] = 'reverse',
                ['--border'] = 'rounded',
            },
            -- Always show hidden files
            files = {
                cmd = "find . -type f -printf '%P\\n'",
                find_opts = "-H", -- Follow symbolic links
            },
            grep = {
                rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case",
            },
        })
    end,
}

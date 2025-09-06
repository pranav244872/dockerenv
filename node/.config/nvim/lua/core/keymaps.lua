-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.g.mapleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize windows with arrow keys
vim.keymap.set("n", "<C-h>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":vertical resize +2<CR>", { silent = true })

-- fzf-lua
-- [[ fzf-lua Keymaps ]]
vim.keymap.set("n", "<leader>?", function() require("fzf-lua").oldfiles() end,
    { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", function() require("fzf-lua").buffers() end,
    { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", function() require("fzf-lua").live_grep() end, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fh", function() require("fzf-lua").help_tags() end, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>en", function()
    require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[E]dit [N]eovim config" })
vim.keymap.set("n", "<leader>dd", function() require("fzf-lua").lsp_document_diagnostics() end,
    { desc = "[D]ocument [D]iagnostics" })

-- oil
-- [[Oil Keymaps]]
-- Open Oil in the root directory (where Neovim was launched)
vim.keymap.set("n", "<leader>rd", function()
    require("oil").open_float(vim.fn.getcwd())
end, { desc = "Open Root Directory in Oil Float" })

-- Open Oil in the current file's directory
vim.keymap.set("n", "<leader>cw", function()
    local filepath = vim.api.nvim_buf_get_name(0)
    if filepath == "" then
        vim.notify("No file loaded in current buffer", vim.log.levels.WARN)
        return
    end
    local dir = vim.fn.fnamemodify(filepath, ":p:h")
    require("oil").open_float(dir)
end, { desc = "Open Current File's Directory in Oil Float" })

-- Open floating diagnostics
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end,
    { desc = "Open Diagnostics in Float" }
)

-- Show list of diagnostics
vim.keymap.set("n", "<leader>dl", function()
    vim.diagnostic.setloclist()
    vim.cmd("lopen")
end, { desc = "[D]iagnostic [L]ist" })

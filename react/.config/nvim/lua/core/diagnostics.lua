-- lua/core/diagnostics.lua

-- This function configures the appearance of diagnostic messages.
vim.diagnostic.config({
    -- Show diagnostics inline with the code
    virtual_text = true,

    -- Add signs to the sign column for errors, warnings, etc.
    signs = true,

    -- Underline the code with the diagnostic
    underline = true,

    -- Configure the floating window for diagnostics
    float = {
        border = "rounded", -- Add a rounded border
        source = "always", -- Always show the source of the diagnostic
    },
})

-- Change the highlight of the diagnostic signs to make them more visible
vim.cmd("highlight DiagnosticSignError guibg=NONE guifg=#ff0000")
vim.cmd("highlight DiagnosticSignWarn guibg=NONE guifg=#ffff00")
vim.cmd("highlight DiagnosticSignInfo guibg=NONE guifg=#00ffff")
vim.cmd("highlight DiagnosticSignHint guibg=NONE guifg=#00ff00")

return {
	"rebelot/kanagawa.nvim",
	priority = 1000, -- Load before all other plugins
	lazy = false, -- Load on startup
	config = function()
		require("kanagawa").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			transparent = false, -- no background color
			dimInactive = false, -- dims inactive windows
			terminalColors = true, -- sets terminal color variables
			theme = "wave", -- default theme: "wave", "dragon", or "lotus"
			colors = {
				-- Optional palette/theme overrides here
			},
		})

		-- Load the colorscheme
		vim.cmd("colorscheme kanagawa")
	end,
}

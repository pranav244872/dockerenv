return {
	"folke/snacks.nvim",
	opts = {
		terminal = {
			win = {
				style = "terminal", -- Optional: defines the window style
			},
			shell = "/bin/bash", -- Optional: override the shell if needed
			auto_close = true, -- Automatically close terminal buffer on exit
		},
	},
}

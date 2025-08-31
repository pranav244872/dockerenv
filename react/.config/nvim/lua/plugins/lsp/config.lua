-- lua/plugins/lsp/config.lua

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- UI for LSP progress
		{ "j-hui/fidget.nvim", opts = {} },
		-- Enhanced capabilities via blink.cmp
		"saghen/blink.cmp",
	},
	config = function()
		-- Get LSP capabilities and enhance them with blink.cmp
		local original_capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

		-- Centralized function for setting keymaps on LspAttach
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Your keymaps (unchanged)
				map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
				map("gO", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
				map("gfd", require("telescope.builtin").diagnostics, "[F]ind [D]iagnostics")
				map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("gca", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "v" })
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gK", vim.lsp.buf.signature_help, "Signature Help")
			end,
		})

		-- Your diagnostic configuration (unchanged)
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
			virtual_text = { source = "if_many", spacing = 2 },
		})

		-- Setup servers using mason-lspconfig
		local lspconfig = require("lspconfig")
		require("mason-lspconfig").setup({
			handlers = {
				-- Default handler for all servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- Custom handler for lua_ls
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								workspace = { library = vim.api.nvim_get_runtime_file("", true) },
							},
						},
					})
				end,
			},
		})
	end,
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { { "folke/neoconf.nvim", cmd = "Neoconf", opts = {} } },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			},
		},

		config = function()
			vim.lsp.enable("gitlab_ci_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("nixd")
			vim.lsp.enable("basedpyright")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("gopls")
			vim.lsp.enable("golang_ci_lint")
			vim.lsp.enable("lemminx")

			vim.lsp.enable("lua_ls")
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
}

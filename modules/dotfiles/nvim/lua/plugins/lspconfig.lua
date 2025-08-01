return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neoconf.nvim",
		},
		config = function()
			vim.lsp.enable({
				"jsonls",
				"lua_ls",
				"nil_ls",
				"vale_ls",
				"nixd",
				"statix",
				"gopls",
				"pyright",
				"lemminx",
				"spectral",
				"html",
				"cssls",
				"yamlls",
				"sqls",
				"markdown_oxide",
			})

			vim.lsp.config("*", {
				root_markers = { ".git" },
				capabilities = {
					textDocument = {
						semanticTokens = {
							multilineTokenSupport = true,
						},
					},
				},
			})
		end,
	},
}

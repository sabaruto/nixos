return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("jsonls")
			vim.lsp.enable("jdtls")
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig"
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer"
			},
		},
	},
}

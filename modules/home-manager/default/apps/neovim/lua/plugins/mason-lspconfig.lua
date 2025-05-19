return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("jsonls")
			vim.lsp.enable("jdtls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("nixd")
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig"
		},
		opts = {
		},
	},
}

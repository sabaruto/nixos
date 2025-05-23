return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = false,
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { 'folke/neodev.nvim', config = true },
		config = function()
			vim.lsp.enable("jsonls")
			vim.lsp.enable("jdtls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("nixd")
			vim.lsp.enable("kulala-ls")
		end
	},
}

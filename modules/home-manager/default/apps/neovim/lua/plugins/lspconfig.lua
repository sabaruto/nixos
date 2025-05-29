return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { 'folke/neodev.nvim', config = true },
		config = function()
			vim.lsp.enable("jdtls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("nixd")
		end
	},
}

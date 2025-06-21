return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { 'folke/neodev.nvim', config = true },
		config = function()
			vim.lsp.enable("jdtls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("nil_ls")
			vim.lsp.enable("nixd")
			vim.lsp.enable("statix")
			vim.lsp.enable("gopls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("lemminx")
			vim.lsp.enable("spectral")
			vim.lsp.enable("html")
			vim.lsp.enable("cssls")
			vim.lsp.enable("yamlls")
			vim.lsp.enable("markdown_oxide")
			vim.lsp.config('*', {
				root_markers = { '.git' },
				capabilities = {
					textDocument = {
						semanticTokens = {
							multilineTokenSupport = true,
						}
					}
				}
			})
		end
	},
}

require("lspconfig")

vim.lsp.enable({
	"cssls",
	"gopls",
	"html",
	"jsonls",
	"lemminx",
	"lua_ls",
	"markdown_oxide",
	"nil_ls",
	"nixd",
	"pyright",
	"spectral",
	"statix",
	"ts_ls",
	"vale_ls",
	"yamlls",
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

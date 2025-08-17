require("lspconfig")

vim.lsp.enable({
	"cssls",
	"cspell_ls",
	"gopls",
	"html",
	"jsonls",
	"lemminx",
	"lua_ls",
	"markdown_oxide",
	"nil_ls",
	"kulala_ls",
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

vim.lsp.config("cspell_ls", {
	cmd = {
		"cspell-lsp",
		"--stdio",
		"-c",
		os.getenv("HOME") .. "/.config/cspell.yml",
	},
	root_markers = {
		".git",
		"cspell.json",
		".cspell.json",
		"cspell.json",
		".cSpell.json",
		"cSpell.json",
		"cspell.config.js",
		"cspell.config.cjs",
		"cspell.config.json",
		"cspell.config.yaml",
		"cspell.config.yml",
		"cspell.yaml",
		".cspell.yaml",
		"cspell.yml",
		".cspell.yml",
	},
})

require("lspconfig")

vim.lsp.enable({
	"cspell_ls",
	"cssls",
	"gopls",
	"html",
	"jsonls",
	"kulala_ls",
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

vim.lsp.config("markdown_oxide", {
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
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
		".cSpell.json",
		".cspell.json",
		".cspell.yaml",
		".cspell.yml",
		".git",
		"cSpell.json",
		"cspell.config.cjs",
		"cspell.config.js",
		"cspell.config.json",
		"cspell.config.yaml",
		"cspell.config.yml",
		"cspell.json",
		"cspell.json",
		"cspell.yaml",
		"cspell.yml",
	},
})

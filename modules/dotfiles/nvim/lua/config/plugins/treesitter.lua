require("nvim-treesitter").setup({
	auto_install = true,
})

local treesitter = require("nvim-treesitter")
treesitter.setup({})

vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		require("nvim-treesitter.parsers").d2 = {
			install_info = {
				url = "https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2",
				revision = "main",
				files = { "src/parser.c", "src/scanner.c" },
			},
			filetype = "d2",
		}
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"c",
		"env",
		"go",
		"http",
		"java",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"nix",
		"regex",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
	},

	callback = function()
		vim.treesitter.start()
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

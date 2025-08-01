return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		branch = "main",

		opts = {
			auto_install = true,
		},

		config = function(_, opts)
			local treesitter = require("nvim-treesitter")
			treesitter.setup(opts)

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
					"c",
					"lua",
					"nix",
					"vim",
					"bash",
					"regex",
					"vimdoc",
					"java",
					"xml",
					"json",
					"yaml",
					"http",
					"python",
					"markdown",
					"markdown_inline",
				},

				callback = function()
					vim.treesitter.start()
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				end,
			})
		end,
	},
}

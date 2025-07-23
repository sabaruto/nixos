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

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"bash",
					"regex",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
				},
			})
		end
	}
}

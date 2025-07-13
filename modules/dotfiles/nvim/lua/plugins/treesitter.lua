return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-refactor",
		},
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			sync_install = false,

			indent = { enable = true },
			highlight = { enable = true },
			autotag = { enable = true },
			refactor = {
				highlight_definitions = {
					enable = true,
				},

				highlight_current_scope = {
					enable = true,
				},

				navigation = {
					enable = true,

					-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
					keymaps = {
						goto_definition = false,
						list_definitions = false,
						list_definitions_toc = false,
						goto_next_usage = "]u",
						goto_previous_usage = "[u",
					},
				},
			},

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
		},
		config = function(_, opts)
			local configs = require("nvim-treesitter.configs")

			configs.setup(opts)
		end,
	},
}

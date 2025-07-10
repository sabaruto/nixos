return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"folke/which-key.nvim",
		},
		opts = {
			source_selector = { winbar = true, },
			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw_behavior = "false",
			},

			window = {
				mappings = {
					[vim.g.rightkey] = "open",
					[vim.g.leftkey] = "close_node",
				},
			},
		},

		config = function(_, opts)
			local wk = require("which-key")
			wk.add({
				{ "<leader>T",  "<CMD>Neotree<CR>",        desc = "(NeoTree) Open Tree" },
				{ "<leader>tT", "<CMD>Neotree toggle<CR>", desc = "(NeoTree) Toggle Tree" },
			})
			return true
		end,
	}
}

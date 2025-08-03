return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			popup_border_style = "",
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },

			source_selector = { winbar = true },
			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw_behavior = "disabled",
			},

			sources = {
				"filesystem",
				"buffers",
				"git_status",
			},

			window = {
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
				},
			},

			buffers = {
				follow_current_file = { enabled = true },
				window = {
					mappings = {
						["l"] = "open",
						["h"] = "close_node",
					},
				},
			},

			git_status = {
				window = {
					mappings = {
						["l"] = "open",
						["h"] = "close_node",
					},
				},
			},

			zk = {
				follow_current_file = true,
			},
		},
		lazy = false,
		keys = {
			{ "<leader>t", "<CMD>Neotree toggle<CR>", desc = "(NeoTree) Toggle Tree" },
		},
	},
}

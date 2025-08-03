local neo_tree = require("neo-tree")
neo_tree.setup({
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
})

require("which-key").add({
	{ "<leader>t", ":Neotree toggle<CR>", desc = "Toggle Neotree" },
})

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
		"document_symbols",
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
	{ "<leader>t", ":Neotree toggle show last<CR>", desc = "Neotree" },
	{ "t", ":Neotree last<CR>", desc = "Toggle Neotree" },
	{
		"<leader>T",
		group = "NeoTree",
		expand = function()
			return {
				{
					"b",
					function()
						vim.cmd(":Neotree buffers")
					end,
					desc = "buffers (NeoTree)",
				},
				{
					"f",
					function()
						vim.cmd(":Neotree filesystem")
					end,
					desc = "files (NeoTree)",
				},
				{
					"g",
					function()
						vim.cmd(":Neotree git_status")
					end,
					desc = "git status (Neotree)",
				},
				{
					"s",
					function()
						vim.cmd(":Neotree document_symbols")
					end,
					desc = "document symbols (Neotree)",
				},
			}
		end,
	},
})

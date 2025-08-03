local zk = require("zk")
local wk = require("which-key")

zk.setup({
	picker = "select",
	lsp = {
		-- `config` is passed to `vim.lsp.start(config)`
		config = {
			name = "zk",
			cmd = { "zk", "lsp" },
			filetypes = { "markdown" },
			-- on_attach = ...
			-- etc, see `:h vim.lsp.start()`
		},

		auto_attach = {
			enabled = true,
		},
	},
})

wk.add({
	{ "<leader>z", group = "zk" },
	{
		{ "<leader>zn", "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>", desc = "New note (zk)" },
		{ "<leader>zf", "<cmd>ZkNotes { sort = { 'modified'} }<cr>", desc = "Open note (zk)" },
		{ "<leader>zt", "<cmd>ZkTags<cr>", desc = "Find related tags (zk)" },
		{ "<leader>fz", "<cmd>ZkNotes<cr>", desc = "Find notes (zk)" },
		{ "<leader>sz", "<cmd>ZkMatch<cr>", desc = "Search in notes (zk)" },
		{ "<leader>fz", "<cmd>'<,'>ZkMatch<cr>", desc = "Find selection in notes (zk)", mode = "v" },
		{ "<leader>zb", "<cmd>ZkBacklinks<cr>", desc = "Open backlinked notes (zk)" },
		{ "<leader>zl", "<cmd>ZkLinks<cr>", desc = "Open linked notes (zk)" },

		-- Groups
		{ "<leader>zg", desc = "groups" },
		{
			"<leader>zgp",
			"<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'projects' }<cr>",
			desc = "New project (zk)",
		},
		{
			"<leader>zgr",
			"<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'resources' }<cr>",
			desc = "New resource (zk)",
		},
		{
			"<leader>zga",
			"<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'areas' }<cr>",
			desc = "New area (zk)",
		},

		-- Types
		{ "<leader>zj", "<cmd>ZkNew { group = 'journal' }<cr>", desc = "New Journal Entry (zk)" },

		-- Local keymaps
		{ "<localleader>", proxy = "<leader>z", group = "zk" },
	},
})

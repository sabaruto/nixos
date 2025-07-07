return {
	{
		"zk-org/zk-nvim",
		opts = {
			picker = "telescope",
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
				}
			},
		},
		config = function(_, opts)
			require("zk").setup(opts)
		end,
		keys = {
			{ "<leader>z",       desc = "(zk)" },

			-- Global keymaps
			{ "<leader>zn",      "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>",                      desc = "New note (zk)" },
			{ "<leader>zf",      "<cmd>ZkNotes { sort = { 'modified'} }<cr>",                               desc = "Open note (zk)" },
			{ "<leader>zt",      "<cmd>ZkTags<cr>",                                                         desc = "Find related tags (zk)" },
			{ "<leader>fz",      "<cmd>ZkNotes<cr>",                                                        desc = "Find notes (zk)" },
			{ "<leader>sz",      "<cmd>ZkMatch<cr>",                                                        desc = "Search in notes (zk)" },
			{ "<leader>fz",      "<cmd>'<,'>ZkMatch<cr>",                                                   desc = "Find selection in notes (zk)", mode = "v" },
			{ "<leader>zb",      "<cmd>ZkBacklinks<cr>",                                                    desc = "Open backlinked notes (zk)", },
			{ "<leader>zl",      "<cmd>ZkLinks<cr>",                                                        desc = "Open linked notes (zk)", },

			-- Groups
			{ "<leader>zg",      desc = "groups" },
			{ "<leader>zgp",     "<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'projects' }<cr>",  desc = "New project (zk)" },
			{ "<leader>zgr",     "<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'resources' }<cr>", desc = "New resource (zk)" },
			{ "<leader>zga",     "<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'areas' }<cr>",     desc = "New area (zk)" },


			-- Types
			{ "<leader>zj",      "<cmd>ZkNew { group = 'journal' }<cr>",                                    desc = "New Journal Entry (zk)" },

			-- Local keymaps
			{ "<localleader>n",  "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>",                      desc = "New note (zk)",                ft = "markdown" },
			{ "<localleader>f",  "<cmd>ZkNotes { sort = { 'modified'} }<cr>",                               desc = "Open note (zk)",               ft = "markdown" },
			{ "<localleader>t",  "<cmd>ZkTags<cr>",                                                         desc = "Find by tags (zk)",            ft = "markdown" },
			{ "<localleader>s",  "<cmd>ZkMatch<cr>",                                                        desc = "Search in notes (zk)",         ft = "markdown" },
			{ "<localleader>s",  "<cmd>'<,'>ZkMatch<cr>",                                                   desc = "Search in notes (zk)",         ft = "markdown", mode = "v" },
			{ "<localleader>b",  "<cmd>ZkBacklinks<cr>",                                                    desc = "Open backlinked notes (zk)",   ft = "markdown" },
			{ "<localleader>l",  "<cmd>ZkLinks<cr>",                                                        desc = "Open linked notes (zk)",       ft = "markdown" },

			{ "<localleader>g",  desc = "groups",                                                           ft = "markdown" },
			{ "<localleader>gp", "<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'projects' }<cr>",  desc = "New project (zk)",             ft = "markdown" },
			{ "<localleader>gr", "<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'resources' }<cr>", desc = "New resource (zk)",            ft = "markdown" },
			{ "<localleader>ga", "<cmd>ZkNew { title = vim.fn.input('Title: '), group = 'areas' }<cr>",     desc = "New area (zk)",                ft = "markdown" },
			{ "<localleader>j",  "<cmd>ZkNew { group = 'journal' }<cr>",                                    desc = "New Journal Entry (zk)",       ft = "markdown" },
		}
	}
}

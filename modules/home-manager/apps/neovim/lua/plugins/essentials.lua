return {
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		opts = {},
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			dashboard = { enabled = false },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			toggle = { enabled = true },
			words = { enabled = true },
		},
		-- stylua: ignore
		keys = {
			{ "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
			{ "<leader>un", function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
			{ "<leader>bd", function() Snacks.bufdelete() end,             desc = "Delete buffer" }
		},
	},
	{
		"folke/flash.nvim",
		opts = {
			prompt = {
				win_config = {
					row = -100,
					col = -50,
				},
			},
		},
		keys = function()
			local flash = require("flash")
			return {
				{
					"s",
					mode = { "n", "x", "o" },
					function()
						flash.jump()
					end,
					desc = "Flash",
				},
				{
					"S",
					mode = { "n", "o", "x" },
					function()
						flash.treesitter()
					end,
					desc = "Flash Treesitter",
				},
				{
					"r",
					mode = { "o" },
					function()
						flash.remote()
					end,
					desc = "Remote Flash",
				},
				{
					"R",
					mode = { "o", "x" },
					function()
						flash.treesitter_search()
					end,
					desc = "Treesitter Search",
				},
				{
					"<c-s>",
					mode = { "c" },
					function()
						flash.toggle()
					end,
					desc = "Toggle Flash Search",
				},
			}
		end,
	},
	{
		"echasnovski/mini.surround",

		mappings = {
			add = "gsa",   -- Add surrounding in Normal and Visual modes
			delete = "gsd", -- Delete surrounding
			find = "gsf",  -- Find surrounding (to the right)
			find_left = "gsF", -- Find surrounding (to the left)
			highlight = "gsh", -- Highlight surrounding
			replace = "gsr", -- Replace surrounding
			update_n_lines = "gsn", -- Update `n_lines`
		},
	},
	{ "tiagovla/scope.nvim",  config = true },
	{ "nvim-lua/plenary.nvim" }
}

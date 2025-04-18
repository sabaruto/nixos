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
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
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
			toggle = { enabled = false },
			words = { enabled = true },
		},
		-- stylua: ignore
		keys = {
			{
				"<leader>n",
				function()
					if Snacks.config.picker and Snacks.config.picker.enabled then
						Snacks.picker.notifications()
					else
						Snacks.notifier.show_history()
					end
				end,
				desc = "Notification History"
			},
			{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
			{ "<leader>bd", function() Snacks.bufdelete() end,     desc = "Delete buffer" }
		},
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})

			vim.keymap.set("n", "<M-left>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<M-Down>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<M-Up>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<M-Right>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set("n", "<M-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			vim.keymap.set("n", "<M-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
		end,
	},
	{
		"folke/flash.nvim",
		opts = {
			modes = {
				search = {
					enabled = true,
				}
			},
			prompt = {
				win_config = {
					row = -100,
					col = -50,
				}
			}
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
					mode = "o",
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
}

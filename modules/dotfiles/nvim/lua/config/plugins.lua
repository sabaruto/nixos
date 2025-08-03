-- Icons
require("nvim-web-devicons").setup()

-- Colourscheme
require("rose-pine").setup()
vim.cmd("colorscheme rose-pine-dawn")

-- Which Key
local wk = require("which-key")

wk.setup({
	preset = "helix",
	win = { row = 50, col = 0 },
	spec = {
		{
			mode = { "n", "v" },
			{ "<leader><tab>", group = "tabs" },
			{
				"<leader>b",
				group = "buffer",
				expand = function()
					return require("which-key.extras").expand.buf()
				end,
			},
			{ "<leader>c", group = "code" },
			{ "<leader>d", group = "debug" },
			{ "<leader>f", group = "file" },
			{ "<leader>g", group = "git" },
			{ "<leader>p", group = "persistence" },
			{ "<leader>q", group = "quit/session" },
			{ "<leader>s", group = "search" },
			{ "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
			{ "<leader>x", group = "windows" },
			{ "[", group = "prev" },
			{ "]", group = "next" },
			{ "g", group = "goto" },
			{ "gs", group = "surround" },
			{ "z", group = "fold" },
			{
				"<leader>?",
				function()
					require("which-key").show({ global = true })
				end,
				desc = " Keymaps (which-key)",
			},
		},
	},
})

require("config.plugins.treesitter")

-- Better Escape
local better_escape = require("better_escape")
better_escape.setup()

require("config.plugins.flash")
require("config.plugins.noice")
require("config.plugins.trouble")
require("config.plugins.neo_tree")
require("config.plugins.lspconfig")
require("config.plugins.lualine")
require("config.plugins.blink")
require("config.plugins.persistence")
-- require("config.plugins.nvim-lint")
require("config.plugins.conform")
require("config.plugins.snacks")
require("config.plugins.mini")
require("config.plugins.gitsigns")
require("config.plugins.telescope")

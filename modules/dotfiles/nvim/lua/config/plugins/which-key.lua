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
					wk.show({ global = true })
				end,
				desc = " Keymaps (which-key)",
			},
		},
	},
})

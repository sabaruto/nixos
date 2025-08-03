return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			win = { row = 50, col = 0 },
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader><tab>", group = "tabs" },
					{ "<leader>b", group = "buffer" },
					{ "<leader>c", group = "code" },
					{ "<leader>d", group = "debug" },
					{ "<leader>f", group = "file" },
					{ "<leader>g", group = "git" },
					{ "<leader>p", group = "peek" },
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
		},
	},
}

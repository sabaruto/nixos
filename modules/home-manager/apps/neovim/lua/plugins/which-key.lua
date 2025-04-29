return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			win = { row = 50 },
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
					{
						"<leader>x<space>",
						function()
							require("which-key").show({ keys = "<leader>x", loop = true })
						end,
						desc = "Hydra Mode (which-key)",
					},
					{
						"<leader><tab><space>",
						function()
							require("which-key").show({ keys = "<leader><tab>", loop = true })
						end,
						desc = "Hydra Mode (which-key)",
					}
				},
			},
		},
	},
}

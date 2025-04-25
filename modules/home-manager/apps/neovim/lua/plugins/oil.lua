return {
	{
		'stevearc/oil.nvim',
		dependencies = { { "echasnovski/mini.icons", opts = {} }, "nvim-tree/nvim-web-devicons" },
		opts = {
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},

			keymaps = {
				-- Quick navigation
				["<left>"] = { "actions.parent", mode = "n" },
				["<right>"] = { "actions.select", mode = "n" },

				-- Window splitting
				["v"] = { "actions.select", mode = "n", opts = { vertical = true } },
				["|"] = { "actions.select", mode = "n", opts = { vertical = true } },
				["h"] = { "actions.select", mode = "n", opts = { horizontal = true } },
				["-"] = { "actions.select", mode = "n", opts = { horizontal = true } },
			},
		},
		lazy = false,
		keys = {
			{ "<leader>fd", ":Oil<CR>",                                          desc = "Oil (cwd)" },
			{ "<leader>fn", ":Oil ~/nixos<CR>",                                  desc = "Oil (nixos config)" },
			{ "<leader>fl", ":Oil ~/nixos/modules/home-manager/apps/neovim<CR>", desc = "Oil (neovim cwd)" },
		}
	}
}

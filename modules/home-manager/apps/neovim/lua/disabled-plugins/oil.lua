local neovim_path = "~/nixos/modules/home-manager/apps/neovim"
local select = "actions.select"

return {
	{
		'stevearc/oil.nvim',
		dependencies = {
			{ "echasnovski/mini.icons", opts = {} },
			"nvim-tree/nvim-web-devicons",
		},
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
				["<right>"] = { select, mode = "n" },

				-- Window splitting
				["v"] = { select, mode = "n", opts = { vertical = true } },
				["|"] = { select, mode = "n", opts = { vertical = true } },
				["h"] = { select, mode = "n", opts = { horizontal = true } },
				["-"] = { select, mode = "n", opts = { horizontal = true } },
			},
		},
		lazy = false,
		keys = {
			{ "<leader>fd", ":Oil<CR>",         desc = "Oil (cwd)" },
			{ "<leader>fn", ":Oil ~/nixos<CR>", desc = "Oil (nixos config)" },
			{
				"<leader>fl",
				string.format(":Oil %s", neovim_path),
				desc = "Oil (neovim cwd)"
			},
		}
	}
}

return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = {
			change_to_vcs_root = true,
			theme = "hyper",
			config = {
				shortcut = {
					{ desc = "Find files", key = "f", group = "@property", action = "Telescope find_files" },
					{ desc = "Switch Workspace", key = "w", group = "@property", action = "WorkspacesOpen" },
					{ desc = "Lazy", key = "L", group = "@property", action = "Lazy" },
				},
				project = {
					enable = false,
				},
				mru = {
					enable = false,
					cwd_only = false,
				},
				footer = {
					vim.uv.cwd(),
				},
			},

			hide = {
				statusline = false,
				winbar = true,
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd({ "TabNew" }, {
				group = vim.api.nvim_create_augroup("Dashboard in new Tab", { clear = true }),
				callback = function()
					vim.cmd("Dashboard")
				end,
			})

			require("dashboard").setup(opts)
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}

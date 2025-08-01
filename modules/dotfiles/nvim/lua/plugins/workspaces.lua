return {
	{
		"natecraddock/workspaces.nvim",
		opts = {
			cd_type = "tab",
			auto_open = false,
			auto_dir = false,

			hooks = {
				open = {
					"Neotree",
					"Telescope find_files",
				},
			},
		},
		keys = {
			{ "<leader>Wa", "<cmd>WorkspacesAdd<cr>" },
			{ "<leader>Wo", "<cmd>WorkspacesOpen<cr>" },
			{ "<leader>Wx", "<cmd>WorkspacesRemove<cr>" },
			{ "<leader>Wr", "<cmd>WorkspacesRename<cr>" },
			{ "<leader>Wl", "<cmd>WorkspacesList<cr>" },

			{ "<leader>Wda", "<cmd>WorkspacesAddDir<cr>" },
			{ "<leader>Wdx", "<cmd>WorkspacesRemoveDir<cr>" },
			{ "<leader>Wds", "<cmd>WorkspacesSyncDirs<cr>" },
		},
	},
}

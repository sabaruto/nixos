return {
	{
		"nvim-telescope/telescope.nvim",
		opts = {
			extensions = {
				projects = { theme = "dropdown" },
			},
		},
	},
	{
		"ahmedkhalf/project.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("project_nvim").setup()
			require("telescope").load_extension("projects")
		end,
		keys = {
			{
				"<leader>sp",
				function()
					require("telescope").extensions.projects.projects(require("telescope.themes").get_dropdown({}))
				end,
				desc = "Find [P]rojects"
			},
		}
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},
}

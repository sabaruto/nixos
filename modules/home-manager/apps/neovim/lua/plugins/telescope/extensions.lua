return {
	{
		"nvim-telescope/telescope.nvim",
		optional = true,
		opts = {
			extensions = {
				projects = { theme = "dropdown" },
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		},
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim", "ahmedkhalf/project.nvim" },
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			telescope.load_extension("projects")
			telescope.load_extension("fzf")
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup()
		end,
		keys = {
			{
				"<leader>sp",
				function()
					require("telescope").extensions.projects.projects(require("telescope.themes").get_dropdown({}))
				end,
				desc = "Find [P]rojects",
			},
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},
}

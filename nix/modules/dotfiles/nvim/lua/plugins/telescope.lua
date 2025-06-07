return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"ahmedkhalf/project.nvim",
				config = function()
					require("project_nvim").setup()
				end,
				keys = {
					{
						"<leader>sp",
						function()
							require("telescope").extensions.projects.projects()
						end,
						desc = "Find [P]rojects",
					},
				},
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
		},

		opts = {
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
			},
			extensions = {
				fzf = {
					fuzzy = true,    -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
				},
			}
		},
		keys = function()
			local telescope = require("telescope.builtin")
			return {
				-- goto
				{ "gd",          telescope.lsp_definitions,           desc = "Goto Definitions" },
				{ "gi",          telescope.lsp_implementations,       desc = "Goto Implementations" },
				{ "gr",          telescope.lsp_references,            desc = "Goto References" },
				{ "gt",          telescope.lsp_type_definitions,      desc = "Goto type References" },
				{ "gps",         telescope.lsp_workspace_symbols,     desc = "Goto workspace symbols" },

				-- find
				{ "<leader>ff",  telescope.find_files,                desc = "Find files" },
				{ "<leader>fw",  telescope.grep_string,               desc = "Find files with word under cursor" },
				{ "<leader>fS",  telescope.lsp_document_symbols,      desc = "Find document symbols" },
				{ "<leader>fr",  telescope.registers,                 desc = "Find registers" },
				{ "<leader>fb",  telescope.buffers,                   desc = "Find buffers" },
				{ "<leader>fo",  telescope.oldfiles,                  desc = "Find recent files" },
				{ "<leader>fB",  telescope.current_buffer_fuzzy_find, desc = "Find buffers with fuzzy find" },
				{ "<leader>fk",  telescope.keymaps,                   desc = "Find keymaps" },
				{ "<leader>fc",  telescope.colorscheme,               desc = "Find colorschemes" },

				-- search
				{ "<leader>s/",  telescope.live_grep,                 desc = "Find files by grep" },

				-- Git
				{ "<leader>gf",  telescope.git_files,                 desc = "Find git files" },
				{ "<leader>gb",  telescope.git_branches,              desc = "Find git branches" },
				{ "<leader>gs",  telescope.git_status,                desc = "Find git status" },
				{ "<leader>gS",  telescope.git_status,                desc = "Find git stash" },

				{ "<leader>gc",  "",                                  desc = "+commits" },
				{ "<leader>gcc", telescope.git_commits,               desc = "Find git commits" },
				{ "<leader>gcb", telescope.git_bcommits,              desc = "Find and checkout git commits" },
				{ "<leader>gcr", telescope.git_bcommits_range,        desc = "Find git commit range" },
			}
		end,
	},
}

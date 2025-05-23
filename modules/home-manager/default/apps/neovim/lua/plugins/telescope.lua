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
							require("telescope").extensions.projects.projects(require(
								"telescope.themes").get_dropdown({}))
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
			pickers = {
				find_files = { theme = "dropdown" },
				git_files = { theme = "dropdown" },
				grep_string = { theme = "dropdown" },
				live_grep = { theme = "dropdown" },
				registers = { theme = "dropdown" },
				buffers = { theme = "dropdown" },
				current_buffer_fuzzy_find = { theme = "dropdown" },
				lsp_definitions = { theme = "dropdown" },
				lsp_implementations = { theme = "dropdown" },
				lsp_references = { theme = "dropdown" },
				lsp_type_references = { theme = "dropdown" },
				lsp_document_symbols = { theme = "dropdown" },
				lsp_workspace_symbols = { theme = "dropdown" },
				diagnostics = { theme = "dropdown" },
			},

			extensions = {
				projects = { theme = "dropdown" },
				fzf = {
					fuzzy = true,    -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			}
		},
		keys = function()
			local telescope = require("telescope.builtin")
			return {
				-- goto
				{ "gd",          function() telescope.lsp_definitions() end,           desc = "Goto Definitions" },
				{ "gi",          function() telescope.lsp_implementations() end,       desc = "Goto Implementations" },
				{ "gR",          function() telescope.lsp_references() end,            desc = "Goto References" },
				{ "gt",          function() telescope.lsp_type_definitions() end,      desc = "Goto type References" },
				{ "gps",         function() telescope.lsp_workspace_symbols() end,     desc = "Goto workspace symbols" },

				-- find
				{ "<leader>ff",  function() telescope.find_files() end,                desc = "Find files" },
				{ "<leader>fw",  function() telescope.grep_string() end,               desc = "Find files with word under cursor" },
				{ "<leader>fS",  function() telescope.lsp_document_symbols() end,      desc = "Find document symbols" },
				{ "<leader>fs",  function() telescope.live_grep() end,                 desc = "Find files by grep" },
				{ "<leader>fr",  function() telescope.registers() end,                 desc = "Find registers" },
				{ "<leader>fb",  function() telescope.buffers() end,                   desc = "Find buffers" },
				{ "<leader>fo",  function() telescope.oldfiles() end,                  desc = "Find recent files" },
				{ "<leader>fB",  function() telescope.current_buffer_fuzzy_find() end, desc = "Find buffers with fuzzy find" },
				{ "<leader>fk",  function() telescope.keymaps() end,                   desc = "Find keymaps" },
				{ "<leader>fc",  function() telescope.colorscheme() end,               desc = "Find colorschemes" },

				-- Git
				{ "<leader>gf",  function() telescope.git_files() end,                 desc = "Find git files" },
				{ "<leader>gb",  function() telescope.git_branches() end,              desc = "Find git branches" },
				{ "<leader>gs",  function() telescope.git_status() end,                desc = "Find git status" },
				{ "<leader>gS",  function() telescope.git_status() end,                desc = "Find git stash" },

				{ "<leader>gc",  "",                                                   desc = "+commits" },
				{ "<leader>gcc", function() telescope.git_commits() end,               desc = "Find git commits" },
				{ "<leader>gcb", function() telescope.git_bcommits() end,              desc = "Find and checkout git commits" },
				{ "<leader>gcr", function() telescope.git_bcommits_range() end,        desc = "Find git commit range" },
			}
		end,
	},
}

return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
			"folke/trouble.nvim",

			"Snikimonkd/telescope-git-conflicts.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-media-files.nvim",
		},

		opts = {
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				path_display = { "smart", "truncate" },
				dynamic_preview_tile = true,
				layout_config = {
					prompt_position = "top",
				},
			},
			pickers = {
				find_files = {},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
				},
				cmdline = {
					mappings = {
						complete = "<Tab>",
						run_selection = "<C-CR>",
						run_input = "<CR>",
					},
				},
			},
		},

		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin_search = require("telescope.builtin")
			local open_with_trouble = require("trouble.sources.telescope").add

			opts["defaults"]["mappings"] = {
				i = { ["<c-t>"] = open_with_trouble },
				n = { ["<c-t>"] = open_with_trouble },
			}

			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("dap")
			telescope.load_extension("conflicts")
			telescope.load_extension("ui-select")
			telescope.load_extension("file_browser")
			telescope.load_extension("media_files")
			telescope.load_extension("workspaces")

			local ext_search = telescope.extensions

			-- goto
			vim.keymap.set({ "n", "v" }, "gd", builtin_search.lsp_definitions, { desc = "Goto Definitions" })
			vim.keymap.set({ "n", "v" }, "gi", builtin_search.lsp_implementations, { desc = "Goto Implementations" })
			vim.keymap.set({ "n", "v" }, "gr", builtin_search.lsp_references, { desc = "Goto References" })
			vim.keymap.set({ "n", "v" }, "gt", builtin_search.lsp_type_definitions, { desc = "Goto type References" })
			vim.keymap.set(
				{ "n", "v" },
				"gps",
				builtin_search.lsp_workspace_symbols,
				{ desc = "Goto workspace symbols" }
			)

			-- find
			vim.keymap.set({ "n", "v" }, "<leader>ff", builtin_search.find_files, { desc = "Find files" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>fw",
				builtin_search.grep_string,
				{ desc = "Find files with word under cursor" }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>fS",
				builtin_search.lsp_document_symbols,
				{ desc = "Find document symbols" }
			)
			vim.keymap.set({ "n", "v" }, "<leader>fr", builtin_search.registers, { desc = "Find registers" })
			vim.keymap.set({ "n", "v" }, "<leader>fo", builtin_search.oldfiles, { desc = "Find recent files" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>f/",
				builtin_search.current_buffer_fuzzy_find,
				{ desc = "Find buffers with fuzzy find" }
			)
			vim.keymap.set({ "n", "v" }, "<leader>fk", builtin_search.keymaps, { desc = "Find keymaps" })
			vim.keymap.set({ "n", "v" }, "<leader>fc", builtin_search.colorscheme, { desc = "Find colorschemes" })
			vim.keymap.set({ "n", "v" }, "<leader>fb", function()
				ext_search.file_browser.file_browser({ path = "%:p:h" })
			end, { desc = "Find Folders / Files" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>fB",
				ext_search.file_browser.file_browser,
				{ desc = "Find Folders / Files (cwd)" }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>fm",
				ext_search.media_files.media_files,
				{ desc = "Find Media Files" }
			)

			-- search
			-- vim.keymap.set({ "n", "v" }, "/", builtin_search.current_buffer_fuzzy_find, { desc = "Search" })
			vim.keymap.set({ "n", "v" }, "<leader>/", builtin_search.live_grep, { desc = "Find files by grep" })

			-- Git
			vim.keymap.set({ "n", "v" }, "<leader>gf", builtin_search.git_files, { desc = "Find git files" })
			vim.keymap.set({ "n", "v" }, "<leader>gb", builtin_search.git_branches, { desc = "Find git branches" })
			vim.keymap.set({ "n", "v" }, "<leader>gs", builtin_search.git_status, { desc = "Find git status" })
			vim.keymap.set({ "n", "v" }, "<leader>gS", builtin_search.git_status, { desc = "Find git stash" })

			vim.keymap.set({ "n", "v" }, "<leader>gcc", builtin_search.git_commits, { desc = "Find git commits" })
			vim.keymap.set(
				{ "n", "v" },
				"<leader>gcb",
				builtin_search.git_bcommits,
				{ desc = "Find and checkout git commits" }
			)
			vim.keymap.set({ "n", "v" }, "<leader>gC", function()
				ext_search.conflicts.conflicts({})
			end, { desc = "Find conflicting files" })
			vim.keymap.set({ "n", "v" }, "<leader>fw", ext_search.workspaces.workspaces, { desc = "Find workspaces" })
		end,
	},
}

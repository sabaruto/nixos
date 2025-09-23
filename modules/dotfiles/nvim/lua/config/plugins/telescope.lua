require("telescope").setup({
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
})

local tls = require("telescope")
tls.load_extension("fzf")
tls.load_extension("dap")
tls.load_extension("conflicts")
tls.load_extension("ui-select")
tls.load_extension("file_browser")
tls.load_extension("media_files")

local wk = require("which-key")
local telescope = require("telescope.builtin")
local telescope_ext = require("telescope").extensions

wk.add({
	{
		mode = { "n", "v" },
		{ "gd", telescope.lsp_definitions, desc = "Goto Definitions" },
		{ "gi", telescope.lsp_implementations, desc = "Goto Implementations" },
		{ "gr", telescope.lsp_references, desc = "Goto References" },
		{ "gt", telescope.lsp_type_definitions, desc = "Goto type References" },
		{ "gps", telescope.lsp_workspace_symbols, desc = "Goto workspace symbols" },

		-- find
		{ "<leader>ff", telescope.find_files, desc = "Find files" },
		{ "<leader>fw", telescope.grep_string, desc = "Find files with word under cursor" },

		{
			"<leader>fS",
			telescope.lsp_document_symbols,
			desc = "Find document symbols",
		},
		{ "<leader>fr", telescope.registers, desc = "Find registers" },
		{ "<leader>fo", telescope.oldfiles, desc = "Find recent files" },

		{
			"<leader>f/",
			telescope.current_buffer_fuzzy_find,
			desc = "Find buffers with fuzzy find",
		},
		{ "<leader>fk", telescope.keymaps, desc = "Find keymaps" },
		{ "<leader>fc", telescope.colorscheme, desc = "Find colorschemes" },
		{ "<leader>fb", telescope.buffers, desc = "Find buffers" },

		{
			"<leader>fB",
			telescope_ext.file_browser.file_browser,
			desc = "Find Folders / Files (cwd)",
		},

		{
			"<leader>fm",
			telescope_ext.media_files.media_files,
			desc = "Find Media Files",
		},

		-- search
		{ "<leader>/", telescope.live_grep, desc = "Find files by grep" },

		-- Git
		{ "<leader>gf", telescope.git_files, desc = "Find git files" },
		{ "<leader>gb", telescope.git_branches, desc = "Find git branches" },
		{ "<leader>gs", telescope.git_status, desc = "Find git status" },
		{ "<leader>gS", telescope.git_status, desc = "Find git stash" },

		{ "<leader>gcc", telescope.git_commits, desc = "Find git commits" },

		{
			"<leader>gcb",
			telescope.git_bcommits,
			desc = "Find and checkout git commits",
		},

		{
			"<leader>gC",
			function()
				telescope_ext.conflicts.conflicts({})
			end,
			desc = "Find conflicting files",
		},
	},
})

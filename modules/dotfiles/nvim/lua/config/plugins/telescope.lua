-- require("telescope-ui-select")
-- require("telescope-dap")
-- require("telescope-media-files")

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
			fuzzy = true,          -- false will only do exact matching
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

local telescope = require("telescope")
telescope.load_extension("fzf")
telescope.load_extension("dap")
telescope.load_extension("conflicts")
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("media_files")

return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },

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
		},
		keys = {
			-- goto
			{
				"gd",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "Goto Definitions",
			},
			{
				"gI",
				function()
					require("telescope.builtin").lsp_implementations()
				end,
				desc = "Goto Implementations",
			},
			{
				"grr",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "Goto References",
			},
			{
				"grt",
				function()
					require("telescope.builtin").lsp_type_references()
				end,
				desc = "Goto type [R]eferences",
			},
			{
				"gs",
				function()
					require("telescope.builtin").lsp_document_symbols()
				end,
				desc = "Goto document symbols",
			},
			{
				"gS",
				function()
					require("telescope.builtin").lsp_workspace_symbols()
				end,
				desc = "Goto workspace symbols",
			},

			-- find
			{
				"<leader>sf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>sg",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Find git files",
			},
			{
				"<leader>sw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Find files with word under cursor",
			},
			{
				"<leader>ss",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Find files by grep",
			},
			{
				"<leader>sr",
				function()
					require("telescope.builtin").registers()
				end,
				desc = "Find registers",
			},
			{
				"<leader>sb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Find buffers",
			},
			{
				"<leader>sB",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Find buffers with fuzzy find",
			},
			-- peek
			{
				"<leader>ps",
				function()
					require("telescope.builtin").lsp_workspace_symbols()
				end,
				desc = "Peek workspace symbols",
			},
		},
	},

}

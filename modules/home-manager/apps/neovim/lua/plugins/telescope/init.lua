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
		keys = function()
			local telescope = require("telescope.builtin")
			return {
				-- goto
				{ "gd",         function() telescope.lsp_definitions() end,           desc = "Goto Definitions" },
				{ "gi",         function() telescope.lsp_implementations() end,       desc = "Goto Implementations" },
				{ "gr",         function() telescope.lsp_references() end,            desc = "Goto References" },
				{ "gt",         function() telescope.lsp_type_definitions() end,      desc = "Goto type [R]eferences" },
				{ "gps",        function() telescope.lsp_workspace_symbols() end,     desc = "Goto workspace symbols" },

				-- find
				{ "<leader>sf", function() telescope.find_files() end,                desc = "Find files" },
				{ "<leader>sg", function() telescope.git_files() end,                 desc = "Find git files" },
				{ "<leader>sw", function() telescope.grep_string() end,               desc = "Find files with word under cursor" },
				{ "<leader>fs", function() telescope.lsp_document_symbols() end,      desc = "Find document symbols" },
				{ "<leader>ss", function() telescope.live_grep() end,                 desc = "Find files by grep" },
				{ "<leader>sr", function() telescope.registers() end,                 desc = "Find registers" },
				{ "<leader>sb", function() telescope.buffers() end,                   desc = "Find buffers" },
				{ "<leader>so", function() telescope.oldfiles() end,                  desc = "Find recent files" },
				{ "<leader>sB", function() telescope.current_buffer_fuzzy_find() end, desc = "Find buffers with fuzzy find" },
				{ "<leader>sk", function() telescope.keymaps() end,                   desc = "Find keymaps" },
				{ "<leader>sc", function() telescope.colorscheme() end,               desc = "Find colorschemes" },
			}
		end,
	},

}

local teleBuiltIn = require('telescope.builtin')
local wk = require('which-key')
local projects = require('telescope').extensions.projects

-- LSP

wk.add({
	mode = { "n" },
	{
		-- goto
		{ "gd",  function() teleBuiltIn.lsp_definitions() end,       desc = "Goto Definitions" },
		{ "gI",  function() teleBuiltIn.lsp_implementations() end,   desc = "Goto Implementations" },
		{ "grr", function() teleBuiltIn.lsp_references() end,        desc = "Goto References" },
		{ "grt", function() teleBuiltIn.lsp_type_references() end,   desc = "Goto type [R]eferences" },
		{ "gs",  function() teleBuiltIn.lsp_document_symbols() end,  desc = "Goto document symbols" },
		{ "gS",  function() teleBuiltIn.lsp_workspace_symbols() end, desc = "Goto workspace symbols" }
	},
	{
		-- find
		{ "<leader>f",  group = "Find" },
		{ "<leader>ff", function() teleBuiltIn.find_files() end,                desc = "Find files" },
		{ "<leader>fg", function() teleBuiltIn.git_files() end,                 desc = "Find git files" },
		{ "<leader>fw", function() teleBuiltIn.grep_string() end,               desc = "Find files with word under cursor" },
		{ "<leader>fs", function() teleBuiltIn.live_grep() end,                 desc = "Find files by grep" },
		{ "<leader>fr", function() teleBuiltIn.registers() end,                 desc = "Find registers" },
		{ "<leader>fb", function() teleBuiltIn.buffers() end,                   desc = "Find buffers" },
		{ "<leader>fB", function() teleBuiltIn.current_buffer_fuzzy_find() end, desc = "Find buffers with fuzzy find" },
		{ "<leader>fp", function() projects.projects {} end,                    desc = "Find buffers with fuzzy find" }
	},
	{
		-- peek
		{ "<leader>p",  group = "Peek" },
		{ "<leader>ps", function() teleBuiltIn.lsp_workspace_symbols() end, desc = "Peek workspace symbols" },
	}
})

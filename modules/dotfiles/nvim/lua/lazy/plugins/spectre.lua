local spectre = "<CMD> lua require('spectre')"

return {
	{
		"nvim-pack/nvim-spectre",
		config = true,

		keys = {
			{ "<leader>Ts", spectre .. ".toggle()<CR>", desc = "Toggle spectre" },
			{
				"<leader>sw",
				spectre .. ".open_visual({select_word=true})<CR>",
				desc = "(Spectre) Search current word",
			},
			{
				"<leader>sw",
				"<ESC>" .. spectre .. ".open_visual()<CR>",
				desc = "(Spectre) Search current word",
				mode = { "v" },
			},
			{
				"<leader>sf",
				spectre .. ".open_file_search({select_word=true})<CR>",
				desc = "(Spectre) Search on current file",
			},
		},
	},
}
